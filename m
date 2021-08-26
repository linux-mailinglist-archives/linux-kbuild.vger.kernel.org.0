Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A403F90A8
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Aug 2021 01:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243775AbhHZWWA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Aug 2021 18:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45381 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243760AbhHZWWA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Aug 2021 18:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630016471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZgK0Vzj/PyGVf287gkB5KcGajjxflHWYHigJAJkYE8o=;
        b=SpUL2EN9m3B+cWKmrBo/UFN9CEgN+hY3Sg9BmGaoDLIQP+tFXphc9VVpnoDVX8Es+75AEv
        XeCzqBBPc0ONCa2qxVHGNWi9YvYZylVEOZzn5qDQB0lhXL8AjVdjfu0ImKZ00rLagBjxDj
        BM5WLTh6zOIdzkx4pn5Ob1aB3V7pw88=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-WYoXGS0zPZm3mv3UZpc0bg-1; Thu, 26 Aug 2021 18:21:10 -0400
X-MC-Unique: WYoXGS0zPZm3mv3UZpc0bg-1
Received: by mail-ot1-f71.google.com with SMTP id v11-20020a056830140b00b0051af4c9ee9fso1830224otp.16
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Aug 2021 15:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgK0Vzj/PyGVf287gkB5KcGajjxflHWYHigJAJkYE8o=;
        b=YCXrhSFgDFnv8dYlZSqOT0MxO6LH1ajws4r59pyMzs5uLhvljFMOGZ5uWi0/a6iKcJ
         BCUEBcQ3NmYcBUHXGiWJtUUGvd/ohkLFpBC7Wgl3jyBhYvOUXfWzLDmxzPJO9uM4Zc/p
         d6k3Poz7cmwa4vHjbQBEVYu2uf+v123wVFJyicON5k8BKsWv/6gtDN95F7O6eTRNBQEr
         i35bKEtiw9sxTdpdUcvgD8U2sxvtNwUnxYR5NcG8Q/V+6KPkif9cKEMB5tnVGLCNDkFN
         vSx5QE1J5S2t1AWNpsInEmQYUlljDec8I/oRc/7VnuSV9h65nPdsXCwayGRhtF0qInG2
         t3ig==
X-Gm-Message-State: AOAM530wSWiwN1QzcjUKi1kGbTARg5I2lgvQek9kqKktTQVF+XiAyt9w
        KvfAGyMo8EfXbPKfO5v/zQeziRa7xuWgWVEkUp9Tiqsnh+rEfKvAhxZ5pp2g0mf7eC/5kf62MJS
        RBwBt41cHJsxDl94yTM+AYEy2
X-Received: by 2002:a05:6808:7:: with SMTP id u7mr12965328oic.63.1630016469675;
        Thu, 26 Aug 2021 15:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4wg/4PueI4scRfq8vf8o5WoWu5Cqwvs4cYyqbBPHaHmLY1mmgaQFiaPn6NoNF0UOWDizXew==
X-Received: by 2002:a05:6808:7:: with SMTP id u7mr12965308oic.63.1630016469544;
        Thu, 26 Aug 2021 15:21:09 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id s24sm840218otp.37.2021.08.26.15.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 15:21:09 -0700 (PDT)
Date:   Thu, 26 Aug 2021 16:21:08 -0600
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
Subject: Re: [PATCH V5 00/13] Introduce vfio_pci_core subsystem
Message-ID: <20210826162108.4fc8b844.alex.williamson@redhat.com>
In-Reply-To: <20210826103912.128972-1-yishaih@nvidia.com>
References: <20210826103912.128972-1-yishaih@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 26 Aug 2021 13:38:59 +0300
Yishai Hadas <yishaih@nvidia.com> wrote:
> 
> Jason Gunthorpe (2):
>   vfio: Use select for eventfd
>   vfio: Use kconfig if XX/endif blocks instead of repeating 'depends on'
> 
> Max Gurtovoy (10):
>   vfio/pci: Rename vfio_pci.c to vfio_pci_core.c
>   vfio/pci: Rename vfio_pci_private.h to vfio_pci_core.h
>   vfio/pci: Rename vfio_pci_device to vfio_pci_core_device
>   vfio/pci: Rename ops functions to fit core namings
>   vfio/pci: Include vfio header in vfio_pci_core.h
>   vfio/pci: Split the pci_driver code out of vfio_pci_core.c
>   vfio/pci: Move igd initialization to vfio_pci.c
>   PCI: Add 'override_only' field to struct pci_device_id
>   PCI / VFIO: Add 'override_only' support for VFIO PCI sub system
>   vfio/pci: Introduce vfio_pci_core.ko
> 
> Yishai Hadas (1):
>   vfio/pci: Move module parameters to vfio_pci.c
> 
>  Documentation/PCI/pci.rst                     |    1 +
>  MAINTAINERS                                   |    1 +
>  drivers/pci/pci-driver.c                      |   28 +-
>  drivers/vfio/Kconfig                          |   29 +-
>  drivers/vfio/fsl-mc/Kconfig                   |    3 +-
>  drivers/vfio/mdev/Kconfig                     |    1 -
>  drivers/vfio/pci/Kconfig                      |   40 +-
>  drivers/vfio/pci/Makefile                     |    8 +-
>  drivers/vfio/pci/vfio_pci.c                   | 2262 +----------------
>  drivers/vfio/pci/vfio_pci_config.c            |   70 +-
>  drivers/vfio/pci/vfio_pci_core.c              | 2158 ++++++++++++++++
>  drivers/vfio/pci/vfio_pci_igd.c               |   19 +-
>  drivers/vfio/pci/vfio_pci_intrs.c             |   42 +-
>  drivers/vfio/pci/vfio_pci_rdwr.c              |   18 +-
>  drivers/vfio/pci/vfio_pci_zdev.c              |    4 +-
>  drivers/vfio/platform/Kconfig                 |    6 +-
>  drivers/vfio/platform/reset/Kconfig           |    4 +-
>  include/linux/mod_devicetable.h               |    6 +
>  include/linux/pci.h                           |   29 +
>  .../linux/vfio_pci_core.h                     |   89 +-
>  scripts/mod/devicetable-offsets.c             |    1 +
>  scripts/mod/file2alias.c                      |   17 +-
>  22 files changed, 2525 insertions(+), 2311 deletions(-)
>  create mode 100644 drivers/vfio/pci/vfio_pci_core.c
>  rename drivers/vfio/pci/vfio_pci_private.h => include/linux/vfio_pci_core.h (56%)

Applied to vfio next branch for v5.15.  Thanks,

Alex 

