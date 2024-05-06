import { Injectable, NotFoundException } from '@nestjs/common';
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

  async findOne(id: number) {
    const client = await this.prisma.client.findUnique({ where: { id } });
    if (!client) {
      throw new NotFoundException(`Client with ID ${id} not found`);
    }
    return client;
  }

  async update(id: number, updateClientDto: UpdateClientDto) {
    const existingClient = await this.findOne(id);
    const data = {
      ...existingClient,
      ...updateClientDto,
      updated_at: new Date(),
    };
    return this.prisma.client.update({ where: { id }, data });
  }

  async remove(id: number) {
    const client = await this.findOne(id);
    if (!client) {
      throw new NotFoundException(`Client with ID ${id} not found`);
    }
    return this.prisma.client.delete({ where: { id } });
  }
}
