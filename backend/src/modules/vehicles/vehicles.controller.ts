import { Controller, Get, Post, Put, Delete, Body, Param, ParseIntPipe } from '@nestjs/common';
import { VehiclesService } from './vehicles.service';
import { Vehicle } from './vehicle.entity';

@Controller('vehicles')
export class VehiclesController {
  constructor(private readonly vehiclesService: VehiclesService) {}

  @Get()
  findAll(): Promise<Vehicle[]> {
    return this.vehiclesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number): Promise<Vehicle> {
    return this.vehiclesService.findOne(id);
  }

  @Post()
  create(@Body() vehicle: Partial<Vehicle>): Promise<Vehicle> {
    return this.vehiclesService.create(vehicle);
  }

  @Put(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() vehicle: Partial<Vehicle>,
  ): Promise<Vehicle> {
    return this.vehiclesService.update(id, vehicle);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number): Promise<void> {
    return this.vehiclesService.remove(id);
  }
}
