import { TestBed } from '@angular/core/testing';

import { CargarUnoService } from './cargar-uno.service';

describe('CargarUnoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CargarUnoService = TestBed.get(CargarUnoService);
    expect(service).toBeTruthy();
  });
});
