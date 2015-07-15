package ecs.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Component
@Transactional
public class TestService {
    @Resource
    private SessionFactory sessionFactory;

    public void testTransaction() {
        Session session = sessionFactory.getCurrentSession();
        session.save(new Tester());
        //  Throw runtime exception to test transaction
//        Integer result = 1 / 0;
        session.save(new Tester());
    }
}