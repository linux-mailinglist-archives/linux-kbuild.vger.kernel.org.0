Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344823D839A
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jul 2021 01:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhG0XCI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 19:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41310 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232599AbhG0XCI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 19:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627426927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M7rRt0unqfhunbDmTgW3PBE42K+S2cwzyUSoewJP8a0=;
        b=f7LWC/sOhnLrsUjap6/6+Uu9H3BfLffoxA+vfOvs/cykQ4lCQxuXbh6Se0UbALNQba513n
        HsFDQfwqKFdp+3znS+WQBB4wCOmVXaSbblbjntqafFCfOXSySH0KTVVgGkUe8XaizOeZDO
        o+J36suNO3gBcS1aoFsuhvenCH9eIDE=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-lZSOBYlaOjKvXhqaeCqUAg-1; Tue, 27 Jul 2021 19:02:05 -0400
X-MC-Unique: lZSOBYlaOjKvXhqaeCqUAg-1
Received: by mail-oo1-f69.google.com with SMTP id y11-20020a4ade0b0000b0290264198007e0so342542oot.14
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 16:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=M7rRt0unqfhunbDmTgW3PBE42K+S2cwzyUSoewJP8a0=;
        b=eZlTlp1y7edM+H34Pu5d+DV6m6iXZhI+QX5RniWWbx37SmZis6By5OgsFV/S+wRXfa
         Ny+ObdhKlK6RjqJUJOp+cFxj2krY1HwVJza2EFS+EJBsL5KyZSmCJ9WCcOiLYJ4TnYcV
         p/B2asoWE55MSMeJMr6qsNmEJvXxgtlinKMa5RBKu8p53bgw/Rdr/SQRrJf4mKJUgX8g
         3r0BjjVPF0biFXvbavtHqNOYr3ErgSnr2qzBjl/nSl9OYQV7LKzv7hXUTdJPGgTX/HMb
         muisAh9t/J0IRTr6d6uyiYjEK99sZhrJREZMrC7TdurcP5mJSJURFMOzOOwIBsEMxTqY
         +HJg==
X-Gm-Message-State: AOAM530pBXtoMFKayTU19Awa+VsKPpeWX10NR0bkin9h/Y+bp2jNAT3r
        Bl7oEr4mRo3C/kRQaEGICLhg1kURSJaYWNcZ1e3PXlyaw/4sul2xzg7e/p4HA89Rksi9YUmfn9H
        jGrojOShrEZIfvlvWJMlzPfga
X-Received: by 2002:aca:cf85:: with SMTP id f127mr13882751oig.87.1627426925176;
        Tue, 27 Jul 2021 16:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMkktFGHDX9ExEF99ePaP2wQQCdjtqn0R0onP29wuHIONSDEOphCmXRcshirz/1uyx4zB8tA==
X-Received: by 2002:aca:cf85:: with SMTP id f127mr13882731oig.87.1627426924981;
        Tue, 27 Jul 2021 16:02:04 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id y19sm833987oia.22.2021.07.27.16.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 16:02:04 -0700 (PDT)
Date:   Tue, 27 Jul 2021 17:02:02 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Yishai Hadas <yishaih@nvidia.com>, bhelgaas@google.com,
        corbet@lwn.net, diana.craciun@oss.nxp.com, kwankhede@nvidia.com,
        eric.auger@redhat.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
        mgurtovoy@nvidia.com, maorg@nvidia.com, leonro@nvidia.com
Subject: Re: [PATCH 09/12] PCI: Add a PCI_ID_F_VFIO_DRIVER_OVERRIDE flag to
 struct pci_device_id
Message-ID: <20210727170202.45c72da0.alex.williamson@redhat.com>
In-Reply-To: <20210727171458.GE1721383@nvidia.com>
References: <20210721161609.68223-1-yishaih@nvidia.com>
        <20210721161609.68223-10-yishaih@nvidia.com>
        <20210727103418.2d059863.alex.williamson@redhat.com>
        <20210727171458.GE1721383@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 27 Jul 2021 14:14:58 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Jul 27, 2021 at 10:34:18AM -0600, Alex Williamson wrote:
> > On Wed, 21 Jul 2021 19:16:06 +0300
> > Yishai Hadas <yishaih@nvidia.com> wrote:
> >   
> > > From: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > 
> > > The new flag field is be used to allow PCI drivers to signal the core code
> > > during driver matching and when generating the modules.alias information.
> > > 
> > > The first use will be to define a VFIO flag that indicates the PCI driver
> > > is a VFIO driver.
> > > 
> > > VFIO drivers have a few special properties compared to normal PCI drivers:
> > >  - They do not automatically bind. VFIO drivers are used to swap out the
> > >    normal driver for a device and convert the PCI device to the VFIO
> > >    subsystem.
> > > 
> > >    The admin must make this choice and following the current uAPI this is
> > >    usually done by using the driver_override sysfs.
> > > 
> > >  - The modules.alias includes the IDs of the VFIO PCI drivers, prefixing
> > >    them with 'vfio_pci:' instead of the normal 'pci:'.
> > > 
> > >    This allows the userspace machinery that switches devices to VFIO to
> > >    know what kernel drivers support what devices and allows it to trigger
> > >    the proper device_override.
> > > 
> > > As existing tools do not recognize the "vfio_pci:" mod-alias prefix this
> > > keeps todays behavior the same. VFIO remains on the side, is never
> > > autoloaded and can only be activated by direct admin action.
> > > 
> > > This patch is the infrastructure to provide the information in the
> > > modules.alias to userspace and enable the only PCI VFIO driver. Later
> > > series introduce additional HW specific VFIO PCI drivers.  
> > 
> > I don't really understand why we're combining the above "special
> > properties" into a single flag.   
> 
> Currently I can't think of any reason to have two flags. We always
> need both behaviors together. It is trivial for someone to change down
> the road, so I prefer to keep the flag bit usage to a minimum.
> 
> > For instance, why wouldn't we create a flag that just indicates a
> > match entry is only for driver override?  
> 
> We still need to signal the generation of vfio_pci: string in the
> modules.alias.
> 
> > Or if we're only using this for full wildcard matches, we could
> > detect that even without a flag.  
> 
> The mlx/hns/etc drivers will not use wildcard matches. This series is
> the prep and the only driver we have right at this point is the
> wildcard vfio_pci generic driver.
> 
> > Then, how does the "vfio_pci:" alias extend to other drivers?    
> 
> After the HW drivers are merged we have a list of things in the
> modules.alias file. Eg we might have something like:
> 
> alias vfio_pci:v000015B3d00001011sv*sd*bc*sc*i* mlx5_vfio_pci
> alias vfio_pci:v0000abc1d0000abcdsv*sd*bc*sc*i* hns_vfio_pci
> alias vfio_pci:v*d*sv*sd*bc*sc*i* vfio_pci
> 
> This flag, and the vfio_pci string, is only for the VFIO subsystem. If
> someday another subsystem wants to use driver_override then it will
> provide its own subsystem name here instead.
> 
> This is solving the problem you had at the start - that userspace must
> be able to self identify the drivers.  Starting with a PCI BDF
> userspace can match the modules.alias for vfio_pci: prefixes and
> determine which string to put into the driver_override sysfs. This is
> instead of having userspace hardwire vfio_pci.
> 
> > Is this expected to be the only driver that would use an alias ever
> > or would other drivers use new bits of the flag?  
> 
> Not sure what you mean by "only driver"? As above every driver
> implementing VFIO on top of PCI will use this flag. If another
> subsystem wants to use driver_override it will define its own flag,
> and it's userspace will look for othersubsytem_pci: tags in
> modules.alias when it wants to change a PCI device over.
> 
> > Seems some documentation is necessary; the comment on
> > PCI_DRIVER_OVERRIDE_DEVICE_VFIO doesn't really help, "This macro is
> > used to create a struct pci_device_id that matches a specific
> > device", then we proceed to use it with PCI_ANY_ID.  
> 
> Fair enough, this is ment in the broader context, the generic vfio_pci
> is just special.
> 
> > vfio-pci has always tried (as much as possible) to be "just another
> > PCI" driver to avoid all the nasty issues that used to exist with
> > legacy KVM device assignment, so I cringe at seeing these vfio specific
> > hooks in PCI-core.  Thanks,  
> 
> It is has always had very special behavior - a PCI driver without a
> match table is is not "just another PCI" driver.
> 
> While this is not entirely elegant, considering where we have ended up
> and the historical ABI that has to be preserved, it is the best idea
> so far anyone has presented.

In general I think my confusion is lack of documentation and examples.
There's good information here and in the cover letter, but reviewing
the patch itself I'm not sure if vfio_pci: is meant to indicate the
vfio_pci driver or the vfio_pci device api or as I've finally decided,
just prepending "vfio_" to the modalias for a device to indicate the
class of stuff, ie. no automatic binding but discoverable by userspace
as a "vfio" driver suitable for this device.

I think we need libvirt folks onboard and maybe a clearer idea what
userspace helpers might be available.  For example would driverctl have
an option to choose a vfio class driver for a device?

I can also imagine that if the flag only covered the
matching/driver_override aspect and pci_device_id further included an
optional modalias prefix, we could do this without littering pci-core
with vfio eccentricities.  I'll be interest to see Bjorn's thoughts on
this.  Thanks,

Alex

