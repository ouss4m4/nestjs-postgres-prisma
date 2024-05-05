import { Injectable } from '@nestjs/common';
import { CreateClientDto } from './dto/create-client.dto';
import { UpdateClientDto } from './dto/update-client.dto';
import { v4 as uuidv4 } from 'uuid';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ClientsService {
  constructor(private prisma: PrismaService) {}
  create(createClientDto: CreateClientDto) {
    const data = {
      ...createClientDto,
      uuid: uuidv4(), // Generate a new UUID for each new client
      // Set other default values or handle other business logic here
      // For example, default status or created_at timestamp
      status: createClientDto.status ?? 1, // Default status if not provided
      created_at: new Date(),
      updated_at: new Date(),
      // You can also set other fields to null or default values if necessary
    };
    return this.prisma.client.create({ data });
  }

  findAll() {
    return this.prisma.client.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} client`;
  }

  update(id: number, updateClientDto: UpdateClientDto) {
    return `This action updates a #${id} client`;
  }

  remove(id: number) {
    return `This action removes a #${id} client`;
  }
}
