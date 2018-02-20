<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 *
 */
class UserFixtures extends Fixture
{
    /**
     * @var UserPasswordEncoderInterface
     */
    private $encoder;

    /**
     * @param UserPasswordEncoderInterface $encoder
     */
    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    /**
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        $user = new User();
        $user->setEmail('admin@example.com');
        $user->setUsername('admin');
        $user->addRole("ADMIN_ROLE");

        $user->setEnabled(true);

        // TODO: Change the default password for admin.
        $password = $this->encoder->encodePassword($user, 'pass_1234');
        $user->setPassword($password);

        $manager->persist($user);
        $manager->flush();
    }
}
