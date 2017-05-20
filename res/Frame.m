self.image.translatesAutoresizingMaskIntoConstraints = NO;


// Constraints.
        
      NSLayoutConstraint *constraint = [NSLayoutConstraint
                                      constraintWithItem:self.image
                                      attribute:NSLayoutAttributeCenterX
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeCenterX
                                      multiplier:1.0f
                                      constant:0.0f];
    
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:self.image
                  attribute:NSLayoutAttributeCenterY
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeCenterY
                  multiplier:1.0f
                  constant:0.0f];
    
    [self.view addConstraint:constraint];

