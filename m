Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946313D7B06
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 18:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhG0QeZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 12:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30037 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229529AbhG0QeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 12:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627403664;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eSN3zUa+aSMFbTfiTDoY4ts+MsujN4ZIL3irtZSd5cc=;
        b=D1XjgNSvzxja2cmLdIWKgjEofGAQfrKLNKIy/L3f9rrWrXHN6gah7WYIEt19O0MV/YRxnf
        Euuf81S6uwP7b6A7YObKSmaffMsBbdsR31INQ9PM3IA7pQQpOHHkmNDz2nZEsuM5f56T/T
        3eVJ5Xwjxi2NpWxX2EX11veVItHBLtQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-mb0cFHkkMgC4_98yqq7RWA-1; Tue, 27 Jul 2021 12:34:23 -0400
X-MC-Unique: mb0cFHkkMgC4_98yqq7RWA-1
Received: by mail-io1-f69.google.com with SMTP id h70-20020a6bb7490000b02904f7957d92b5so11375242iof.21
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 09:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=eSN3zUa+aSMFbTfiTDoY4ts+MsujN4ZIL3irtZSd5cc=;
        b=gLEXx/ler+Bin2xXzON/fACpgbzd39nbSpGIWTsRKRR40kTw0Q1PDOVyiaBvUgjJQS
         6Tn2a3xQoiA76owY7T4eFmkZHxg20zZXK0hys8OLoKDxKfcdk7HfOCdRg7kJ+GWfx7JI
         PBgxVWBSeby2JBRJBnYL3bt0it9AVLbTkWhZR7ktOHYb26HTUmP7Hgk3P2o2B+yYVdXP
         1PIqMRrNGAhbQc8MWnssedwZ+z1qWc2RmNmOb8jNZY4IngI2IlXDpOmosrltAr60Qh76
         qcq0Og3aLKueJzmD/Oyw6gGV6/BPkDM2kO4ckxphbtqUtYpEzTCRzyXi99yCh1Ge/7vy
         xm6w==
X-Gm-Message-State: AOAM530LNowOHZirx8Bw+kJ3JMif9SIPReHMcPyOhGR4UKKj6jXtEbje
        5v65Aoby5dLouYJ5yI1Soz2p2Tu/l3h/vN4yxJpP3eFLbVMaSigRITPgIc2oOsCDxiCWUvuwF0n
        NEQVOjDS68h3DGlR1emav20Dd
X-Received: by 2002:a5d:878d:: with SMTP id f13mr5846920ion.83.1627403662579;
        Tue, 27 Jul 2021 09:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNDLuiJUlkwcG5wDeSXc83uop3QQ8klnj9cewIBJA3vjAmH06hqKaz8ZuEyt2S7VEnZ31d5w==
X-Received: by 2002:a5d:878d:: with SMTP id f13mr5846896ion.83.1627403662311;
        Tue, 27 Jul 2021 09:34:22 -0700 (PDT)
Received: from redhat.com ([198.49.6.230])
        by smtp.gmail.com with ESMTPSA id f7sm2156386ils.42.2021.07.27.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 09:34:21 -0700 (PDT)
Date:   Tue, 27 Jul 2021 10:34:18 -0600
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
Subject: Re: [PATCH 09/12] PCI: Add a PCI_ID_F_VFIO_DRIVER_OVERRIDE flag to
 struct pci_device_id
Message-ID: <20210727103418.2d059863.alex.williamson@redhat.com>
In-Reply-To: <20210721161609.68223-10-yishaih@nvidia.com>
References: <20210721161609.68223-1-yishaih@nvidia.com>
        <20210721161609.68223-10-yishaih@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 21 Jul 2021 19:16:06 +0300
Yishai Hadas <yishaih@nvidia.com> wrote:

> From: Max Gurtovoy <mgurtovoy@nvidia.com>
> 
> The new flag field is be used to allow PCI drivers to signal the core code
> during driver matching and when generating the modules.alias information.
> 
> The first use will be to define a VFIO flag that indicates the PCI driver
> is a VFIO driver.
> 
> VFIO drivers have a few special properties compared to normal PCI drivers:
>  - They do not automatically bind. VFIO drivers are used to swap out the
>    normal driver for a device and convert the PCI device to the VFIO
>    subsystem.
> 
>    The admin must make this choice and following the current uAPI this is
>    usually done by using the driver_override sysfs.
> 
>  - The modules.alias includes the IDs of the VFIO PCI drivers, prefixing
>    them with 'vfio_pci:' instead of the normal 'pci:'.
> 
>    This allows the userspace machinery that switches devices to VFIO to
>    know what kernel drivers support what devices and allows it to trigger
>    the proper device_override.
> 
> As existing tools do not recognize the "vfio_pci:" mod-alias prefix this
> keeps todays behavior the same. VFIO remains on the side, is never
> autoloaded and can only be activated by direct admin action.
> 
> This patch is the infrastructure to provide the information in the
> modules.alias to userspace and enable the only PCI VFIO driver. Later
> series introduce additional HW specific VFIO PCI drivers.

I don't really understand why we're combining the above "special
properties" into a single flag.  For instance, why wouldn't we create a
flag that just indicates a match entry is only for driver override?  Or
if we're only using this for full wildcard matches, we could detect
that even without a flag.

Then, how does the "vfio_pci:" alias extend to other drivers?  Is this
expected to be the only driver that would use an alias ever or would
other drivers use new bits of the flag?  Seems some documentation is
necessary; the comment on PCI_DRIVER_OVERRIDE_DEVICE_VFIO doesn't
really help, "This macro is used to create a struct pci_device_id that
matches a specific device", then we proceed to use it with PCI_ANY_ID.

vfio-pci has always tried (as much as possible) to be "just another
PCI" driver to avoid all the nasty issues that used to exist with
legacy KVM device assignment, so I cringe at seeing these vfio specific
hooks in PCI-core.  Thanks,

Alex

