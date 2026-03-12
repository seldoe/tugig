import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Vehicle } from './vehicle.entity';

@Injectable()
export class VehiclesService {
  constructor(
    @InjectRepository(Vehicle)
    private vehicleRepository: Repository<Vehicle>,
  ) {}

  async findAll(): Promise<Vehicle[]> {
    return this.vehicleRepository.find();
  }

  async findOne(id: number): Promise<Vehicle> {
    return this.vehicleRepository.findOne({ where: { id } });
  }

  async create(vehicle: Partial<Vehicle>): Promise<Vehicle> {
    return this.vehicleRepository.save(vehicle);
  }

  async update(id: number, vehicle: Partial<Vehicle>): Promise<Vehicle> {
    await this.vehicleRepository.update(id, vehicle);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.vehicleRepository.delete(id);
  }
}
