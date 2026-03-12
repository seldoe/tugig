import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return '🚛 途吉天下卡车管理系统 API';
  }
}
