import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  Query,
} from '@nestjs/common';
import { ProductsService } from '../services/products.service';
import {
  CreateProductInput,
  Product,
  UpdateProductInput,
} from '../product.types';
import { get } from 'http';

@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Get()
  findAll(): Product[] {
    return this.productsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Product {
    return this.productsService.findOne(Number(id));
  }

  @Get()
  findByName(@Query('name') name: string): Product[] {
    return this.productsService.findAll().filter((product) =>
      product.name.toLowerCase().includes(name.toLowerCase()),
    );
  }

  @Post()
  create(@Body() body: CreateProductInput): Product {
    return this.productsService.create(body);
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() body: UpdateProductInput): Product {
    return this.productsService.update(Number(id), body);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Product {
    return this.productsService.remove(Number(id));
  }
}

