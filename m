Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFA73F6B56
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 23:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235827AbhHXVtb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 17:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27431 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235710AbhHXVta (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 17:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629841725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w5pw4YrTSgHugcG2Eo+G7n0AOgzo2eruh1sMMnqSXgQ=;
        b=ZL9k2N2gZEReKaOAMR/NoaLbzAseLsWiUwfE/8feDrGN8BZmf1OrIOb5fEwaeQG4y9NK3u
        N5qLPGl4VY8Bu7/jI2H+RKHr0KAFeK0wMwDYHKCdanVpGYRlVa2PB1U+H6/bZj2ANDW15p
        Rn7PRMT5bFGb4Y3AsZCgN1R7F0XdOcM=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-AS9vR_osPDOhM2EE3b2xsA-1; Tue, 24 Aug 2021 17:48:43 -0400
X-MC-Unique: AS9vR_osPDOhM2EE3b2xsA-1
Received: by mail-il1-f198.google.com with SMTP id r6-20020a92c506000000b002246015b2a4so12636296ilg.21
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Aug 2021 14:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=w5pw4YrTSgHugcG2Eo+G7n0AOgzo2eruh1sMMnqSXgQ=;
        b=meFhdBl/kCKYGvrA3z1oJjqr3I/oK289HXT/rjh6dwSSiHIVtvUbGxtfFUX//7wxyG
         J5eQZFwcBNuQZIR5+u0evFJjn5sLvh9XcfcIM0fyST2V7yLIYzUNtGtcDWfZ0PcHfZMa
         EbvvDn3gs4hIGNob3DkGs+orPCJqBMlZ6g4KbHTmZwPlxSadFy8PgGOCFFZ0NVVWentC
         UzovhCXC+1HiwTizFBjO8AZBou+E9O6J8l0e4fSZjz+fOfSLuqMO69hoJF+cJte1ujyN
         rffDHpwS1uT+vZVt3G5/o2hBHZW8ESU4XLxJ6HiH06K0EYLCtnMx6Zf8yCxZEphXemwG
         cVTw==
X-Gm-Message-State: AOAM530dcoCOqyYZM6Ka97ZdfOzF9/i5HagHRNIE/KaPNIkpAGtr/2vs
        3G6mIvG5RFbbAeehKk3VKouJcvsk93kN3Y2QLK+Jog+8eBwGZ2JeAJGzUJ6V+fCfkDxqFugIgtK
        HP03PMVIcARavmIU1ALrI4Bej
X-Received: by 2002:a5d:8484:: with SMTP id t4mr31967449iom.126.1629841723234;
        Tue, 24 Aug 2021 14:48:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV/BFYIt+phRVOjM0gliAb4WNS6a2RZJbXAlwZJ6Po16uZZA+rPyg3jivRBbxcxlIzm02ZEg==
X-Received: by 2002:a5d:8484:: with SMTP id t4mr31967436iom.126.1629841723033;
        Tue, 24 Aug 2021 14:48:43 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id a8sm10590565ilq.63.2021.08.24.14.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 14:48:42 -0700 (PDT)
Date:   Tue, 24 Aug 2021 15:48:39 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Max Gurtovoy <mgurtovoy@nvidia.com>
Cc:     Yishai Hadas <yishaih@nvidia.com>, <bhelgaas@google.com>,
        <corbet@lwn.net>, <diana.craciun@oss.nxp.com>,
        <kwankhede@nvidia.com>, <eric.auger@redhat.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <kvm@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>, <jgg@nvidia.com>,
        <maorg@nvidia.com>, <leonro@nvidia.com>
Subject: Re: [PATCH V3 06/13] vfio/pci: Split the pci_driver code out of
 vfio_pci_core.c
Message-ID: <20210824154839.159a1243.alex.williamson@redhat.com>
In-Reply-To: <393721ae-2183-2b1b-f670-8006992c4e55@nvidia.com>
References: <20210822143602.153816-1-yishaih@nvidia.com>
        <20210822143602.153816-7-yishaih@nvidia.com>
        <20210823091624.697c67d6.alex.williamson@redhat.com>
        <393721ae-2183-2b1b-f670-8006992c4e55@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 23 Aug 2021 18:28:49 +0300
Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> On 8/23/2021 6:16 PM, Alex Williamson wrote:
> > On Sun, 22 Aug 2021 17:35:55 +0300
> > Yishai Hadas <yishaih@nvidia.com> wrote:  
> >> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> >> new file mode 100644
> >> index 000000000000..15474ebadd98
> >> --- /dev/null
> >> +++ b/drivers/vfio/pci/vfio_pci.c  
> > ...  
> >> +static int vfio_pci_sriov_configure(struct pci_dev *pdev, int nr_virtfn)
> >> +{
> >> +	might_sleep();
> >> +
> >> +	if (!enable_sriov)
> >> +		return -ENOENT;
> >> +
> >> +	return vfio_pci_core_sriov_configure(pdev, nr_virtfn);
> >> +}  
> > As noted in previous version, why do we need the might_sleep() above
> > when the core code below includes it and there's nothing above that
> > might sleep before that?  Thanks,  
> 
> This is used to mention vfio_pci_core_sriov_configure might sleep.
> 
> If this is redundant, can you please remove this one line upon merge ?

I guess I'm not sure how far up we need to, or should, percolate
might_sleep() annotations.  vfio_pci_core_sriov_configure() calls
vfio_device_get_from_dev() which makes use of mutexes, which I think is
the original reason for the annotation there ahead of those in the PCI
iov code.  But is the annotation through mutex_lock() enough on its own,
ie. should we remove all of our gratuitous annotations in the vfio part
of the code path?  Thanks,

Alex

> >> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> >> index 94f062818e0c..87d1960d0d61 100644
> >> --- a/drivers/vfio/pci/vfio_pci_core.c
> >> +++ b/drivers/vfio/pci/vfio_pci_core.c  
> > ...  
> >> -static int vfio_pci_sriov_configure(struct pci_dev *pdev, int nr_virtfn)
> >> +int vfio_pci_core_sriov_configure(struct pci_dev *pdev, int nr_virtfn)
> >>   {
> >>   	struct vfio_device *device;
> >>   	int ret = 0;
> >>   
> >>   	might_sleep();
> >>   
> >> -	if (!enable_sriov)
> >> -		return -ENOENT;
> >> -
> >>   	device = vfio_device_get_from_dev(&pdev->dev);
> >>   	if (!device)
> >>   		return -ENODEV;  
> 

