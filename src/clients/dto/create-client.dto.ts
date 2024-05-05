import { ApiProperty } from '@nestjs/swagger';

export class CreateClientDto {
  @ApiProperty()
  name: string;

  @ApiProperty()
  client_type: number;

  @ApiProperty()
  client_group: number;

  @ApiProperty()
  margin: number;

  @ApiProperty()
  notes: string;
  @ApiProperty()
  status: number;
}
