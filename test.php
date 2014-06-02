<?php

namespace Flooved\Docs\ApiBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Job
 *
 * @ORM\Table()
 * @ORM\Entity
 */
class Job extends AbstractEntity
{
    /**
     * @protected
     * @ORM\Column( type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * the job id
     * @read-only
     * @var string
     *
     * @ORM\Column(type="string", length=255)
     */
    private $code;

    /**
     * snake cased var
     *
     * @var string
     */
    private $snaked_case_var;

    /**
     * private underscore variable
     *
     * @var string
     */
    private $_underscored;

    /**
     * @var string
     */
    private $smartVariableName;


    public function __construct()
    {
        $this->started = new \DateTime;
        $this->conversionDone = false;
    }

    /**
     * Get the value of the job id
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set the value of the job id
     *
     * @param string code
     *
     * @return self
     */
    private function setCode($value)
    {
        $this->code = $value;

        return $this;
    }


    /**
     * Get the value of snake cased var
     *
     * @return string
     */
    public function getSnakedCaseVar()
    {
        return $this->snaked_case_var;
    }

    /**
     * Set the value of snake cased var
     *
     * @param string snaked_case_var
     *
     * @return self
     */
    public function setSnakedCaseVar($value)
    {
        $this->snaked_case_var = $value;

        return $this;
    }


    /**
     * Get the value of private underscore variable
     *
     * @return string
     */
    public function getUnderscored()
    {
        return $this->_underscored;
    }


    /**
     * Set the value of private underscore variable
     *
     * @param string _underscored
     *
     * @return self
     */
    public function setUnderscored($value)
    {
        $this->_underscored = $value;

        return $this;
    }


    /**
     * Get the value of Smart Variable Name
     *
     * @return string
     */
    public function getSmartVariableName()
    {
        return $this->smartVariableName;
    }

    /**
     * Set the value of Smart Variable Name
     *
     * @param string smartVariableName
     *
     * @return self
     */
    public function setSmartVariableName($value)
    {
        $this->smartVariableName = $value;
        return $this;
    }

}
