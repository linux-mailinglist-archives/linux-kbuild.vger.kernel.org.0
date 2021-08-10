Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20DD3D822E
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 23:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbhG0Vyq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 17:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52899 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232817AbhG0Vyq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 17:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627422884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yvQTTkfcrLZXncADcYnW+DivOnY4gH65JuSHhZAqY0g=;
        b=PmvpKcbuTVo2muCBKzE98eYpyc9a14nD0jfH7CqJxsdTpXd98fPhnwLVTZ7D4nf2Q95NhQ
        Nc2lqrldlAq9BMGDUxivQm//HMagSt/DfUJZgx3qtz6sin5sXcJ7RNSSwkoKgAnHspftm2
        jF8B9BZ4AvINlqaOmKPTa9wrxLa4ulg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-2wn2gsr2OxSGMDQdAYOc0A-1; Tue, 27 Jul 2021 17:54:43 -0400
X-MC-Unique: 2wn2gsr2OxSGMDQdAYOc0A-1
Received: by mail-oo1-f70.google.com with SMTP id r15-20020a4aea8f0000b029025ec20a413eso262936ooh.11
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 14:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=yvQTTkfcrLZXncADcYnW+DivOnY4gH65JuSHhZAqY0g=;
        b=CB4xJcdeEqnFJoBjuMbA9detapwR4JPnEqCqjzbge20KkAM3nT4mmbjApI8DCRdElD
         VyIveFbDjqtraKKey58knqeHwmP+flWsUhAyyLXYDiYoB1J+3mYDskIcz4VFNvZiBh/Y
         h6hWiUIc+CEZU2GYuZPnEOkf1g9nnuEyrXE6j4LsetCoVkGMpzj8BdF12aYitBF5k7Wh
         SkuuGIyGF8M81Ioeb3wiagYhewQiUO/EP7vIgWy40YU4ooyHOk33rLecZYj5IPeExB0Y
         YkQCwU8emWepBUaSeXaWfqWUHXhfIKrwAcwGjUqgnu3zXIf8RNbzh475Brvr2f9arMit
         rYVg==
X-Gm-Message-State: AOAM532aTjekAMGMbu9UNapAOwmSsNRPS9YnMjCsn5P+fk6Aj4w+O51H
        stH1pd2QTpIBR/i3IMX8bWhFHT2aOwDThXD2BoktE9kAnd8FzvZTZLQv8eZdT/M98L8pBvHFz2x
        R9StCa83Hair3csNuWuLWOlyH
X-Received: by 2002:a54:4895:: with SMTP id r21mr16001766oic.30.1627422882834;
        Tue, 27 Jul 2021 14:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynpzSiqfgKibVjl4PLtaAutE2wTvwDVL90lKptkcJX811Umoi4U6iHgANFR9Wxyyt55EglfQ==
X-Received: by 2002:a54:4895:: with SMTP id r21mr16001747oic.30.1627422882560;
        Tue, 27 Jul 2021 14:54:42 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id m19sm731736otp.55.2021.07.27.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:54:42 -0700 (PDT)
Date:   Tue, 27 Jul 2021 15:54:40 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Yishai Hadas <yishaih@nvidia.com>
Cc:     <bhelgaas@google.com>, <corbet@lwn.net>,
        <diana.craciun@oss.nxp.com>, <kwankhede@nvidia.com>,
        <eric.auger@redhat.com>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <linux-pci@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <linux-s390@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        <mgurtovoy@nvidia.com>, <jgg@nvidia.com>, <maorg@nvidia.com>,
        <leonro@nvidia.com>
Subject: Re: [PATCH 12/12] vfio/pci: Introduce vfio_pci_core.ko
Message-ID: <20210727155440.680ee22e.alex.williamson@redhat.com>
In-Reply-To: <20210721161609.68223-13-yishaih@nvidia.com>
References: <20210721161609.68223-1-yishaih@nvidia.com>
        <20210721161609.68223-13-yishaih@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 21 Jul 2021 19:16:09 +0300
Yishai Hadas <yishaih@nvidia.com> wrote:

> From: Max Gurtovoy <mgurtovoy@nvidia.com>
> 
> Now that vfio_pci has been split into two source modules, one focusing
> on the "struct pci_driver" (vfio_pci.c) and a toolbox library of code
> (vfio_pci_core.c), complete the split and move them into two different
> kernel modules.
> 
> As before vfio_pci.ko continues to present the same interface under
> sysfs and this change will have no functional impact.
> 
> Splitting into another module and adding exports allows creating new HW
> specific VFIO PCI drivers that can implement device specific
> functionality, such as VFIO migration interfaces or specialized device
> requirements.
> 
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> ---
>  drivers/vfio/pci/Kconfig                      | 30 ++++++++------
>  drivers/vfio/pci/Makefile                     |  8 ++--
>  drivers/vfio/pci/vfio_pci.c                   | 14 ++-----
>  drivers/vfio/pci/vfio_pci_config.c            |  2 +-
>  drivers/vfio/pci/vfio_pci_core.c              | 41 ++++++++++++++++---
>  drivers/vfio/pci/vfio_pci_igd.c               |  2 +-
>  drivers/vfio/pci/vfio_pci_intrs.c             |  2 +-
>  drivers/vfio/pci/vfio_pci_rdwr.c              |  2 +-
>  drivers/vfio/pci/vfio_pci_zdev.c              |  2 +-
>  .../pci => include/linux}/vfio_pci_core.h     |  2 -
>  10 files changed, 66 insertions(+), 39 deletions(-)
>  rename {drivers/vfio/pci => include/linux}/vfio_pci_core.h (99%)
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index afdab7d71e98..18898ae49919 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -1,19 +1,31 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -config VFIO_PCI
> +config VFIO_PCI_CORE
>  	tristate "VFIO support for PCI devices"
>  	depends on PCI
>  	depends on MMU
>  	select VFIO_VIRQFD
>  	select IRQ_BYPASS_MANAGER
>  	help
> -	  Support for the PCI VFIO bus driver.  This is required to make
> -	  use of PCI drivers using the VFIO framework.
> +	  Support for using PCI devices with VFIO.
> +
> +if VFIO_PCI_CORE
> +config VFIO_PCI_MMAP
> +	def_bool y if !S390
> +
> +config VFIO_PCI_INTX
> +	def_bool y if !S390
> +
> +config VFIO_PCI
> +	tristate "Generic VFIO support for any PCI device"
> +	help
> +	  Support for the generic PCI VFIO bus driver which can connect any
> +	  PCI device to the VFIO framework.
>  
>  	  If you don't know what to do here, say N.
>  

I'm still not happy with how this is likely to break users and even
downstreams when upgrading to a Kconfig with this change.  A previously
selected VFIO_PCI comes out disabled unless the user is keen enough to
enable VFIO_PCI_CORE.  I think I'd prefer to sacrifice the purity of
the menus to pull VFIO_PCI out of the if block and have it select
VFIO_PCI_CORE.  Thanks,

Alex

