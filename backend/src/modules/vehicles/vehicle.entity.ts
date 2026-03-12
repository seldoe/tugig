import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('vehicles')
export class Vehicle {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 50 })
  plateNumber: string; // 车牌号

  @Column({ length: 50, nullable: true })
  brand: string; // 品牌

  @Column({ length: 50, nullable: true })
  model: string; // 型号

  @Column({ length: 20, nullable: true })
  vehicleType: string; // 车辆类型

  @Column({ length: 20, nullable: true })
  color: string; // 颜色

  @Column({ nullable: true })
  ownerId: number; // 车主ID

  @Column({ default: 1 })
  status: number; // 状态: 1=正常, 0=离线

  @CreateDateColumn()
  createTime: Date;

  @UpdateDateColumn()
  updateTime: Date;
}
