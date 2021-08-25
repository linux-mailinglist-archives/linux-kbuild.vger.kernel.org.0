Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8507D3F7EA7
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 00:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhHYWe3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 18:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49244 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231378AbhHYWe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 18:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629930822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W2s2lKx+M8e7vRsFegnV5E2n16k3Db//auuN9XiWQNI=;
        b=f1exkAaVRzOEBQ1OSkoBIr9N3fj3vunrxWtikq8beQD+dOFmuoSa6PC8mpachb4bY3yhWf
        lXm6W0j4Rf4nYQlAfc1W2HwE1E76DSBoszPGq8yHBgOi+4QdQ46eyVW6VYEj19wVG2Zkfz
        ic6lsAM8m9LAV7C7rzR2Fc5bdFhAWoE=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-BzuqIa4BOI-RXBTyZrD2DQ-1; Wed, 25 Aug 2021 18:33:41 -0400
X-MC-Unique: BzuqIa4BOI-RXBTyZrD2DQ-1
Received: by mail-oo1-f70.google.com with SMTP id 187-20020a4a01c40000b029028b01802752so393429oor.6
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 15:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=W2s2lKx+M8e7vRsFegnV5E2n16k3Db//auuN9XiWQNI=;
        b=lnKRkzDgJKizZ7d9Dz7GlpQuN/9PoL3rDV9Ipi/DoTndZC6f3byvh1eryv5W2F6LFS
         8xcqYhO97ehsYIUdbRc6uYEi8RnWM8H5SDX3JqB+OBRd5wwZdctvwxW6cRWcksbegtNK
         kiZZkQ+PSlGR+DaVBZfvdwYKowL5A4vJeLPBUgKWalOgn4PRnv3l/1+ryCQPg88hIQxd
         LZJal7bg+l3a+KIFhaRK/Ob+2zKyh7YPOO7wpj5JEqYDVGPNL5GAHM2cyLBm05rDK66M
         czPDIk7bL3TwpCjVItGqnqO8umhFjd/KWe67rgJExQc2vnOOfLLaT4dm12eULkLG/mtl
         DVvA==
X-Gm-Message-State: AOAM531Tsg5LX48pJNwb1aO6YMCZnT7I4xkw/NSzl6AqKbQj9u7qTM7C
        LvDmRFhrAuirsA6buM7980DzKMjBUJ8VDNd4vpJKOvPSSP2TFbxMsiscyKxCWt033rikx27ZHty
        aGaPWsGsKxBQIrHrOVmxzTfZW
X-Received: by 2002:a9d:5d01:: with SMTP id b1mr539920oti.263.1629930820474;
        Wed, 25 Aug 2021 15:33:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO2O7S9ysUHHjEJeBxwPTAt83BOcqHoSfdMF0B2hh/JiarjF0RvnZ+1Q/OfBSxJD4SlynzcA==
X-Received: by 2002:a9d:5d01:: with SMTP id b1mr539908oti.263.1629930820252;
        Wed, 25 Aug 2021 15:33:40 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id c37sm210594otu.60.2021.08.25.15.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 15:33:40 -0700 (PDT)
Date:   Wed, 25 Aug 2021 16:33:38 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Yishai Hadas <yishaih@nvidia.com>, bhelgaas@google.com,
        corbet@lwn.net, diana.craciun@oss.nxp.com, kwankhede@nvidia.com,
        eric.auger@redhat.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
        mgurtovoy@nvidia.com, maorg@nvidia.com, leonro@nvidia.com
Subject: Re: [PATCH V4 10/13] PCI / VFIO: Add 'override_only' support for
 VFIO PCI sub system
Message-ID: <20210825163338.68ad5a4d.alex.williamson@redhat.com>
In-Reply-To: <20210825222443.GN1721383@nvidia.com>
References: <20210825135139.79034-1-yishaih@nvidia.com>
        <20210825135139.79034-11-yishaih@nvidia.com>
        <20210825160546.380c0137.alex.williamson@redhat.com>
        <20210825222443.GN1721383@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 25 Aug 2021 19:24:43 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Aug 25, 2021 at 04:05:46PM -0600, Alex Williamson wrote:
> > On Wed, 25 Aug 2021 16:51:36 +0300
> > Yishai Hadas <yishaih@nvidia.com> wrote:  
> > > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > > index 7c97fa8e36bc..c3edbf73157e 100644
> > > +++ b/scripts/mod/file2alias.c
> > > @@ -426,7 +426,7 @@ static int do_ieee1394_entry(const char *filename,
> > >  	return 1;
> > >  }
> > >  
> > > -/* Looks like: pci:vNdNsvNsdNbcNscNiN. */
> > > +/* Looks like: pci:vNdNsvNsdNbcNscNiN or <prefix>_pci:vNdNsvNsdNbcNscNiN. */
> > >  static int do_pci_entry(const char *filename,
> > >  			void *symval, char *alias)
> > >  {
> > > @@ -440,8 +440,12 @@ static int do_pci_entry(const char *filename,
> > >  	DEF_FIELD(symval, pci_device_id, subdevice);
> > >  	DEF_FIELD(symval, pci_device_id, class);
> > >  	DEF_FIELD(symval, pci_device_id, class_mask);
> > > +	DEF_FIELD(symval, pci_device_id, override_only);
> > >  
> > > -	strcpy(alias, "pci:");
> > > +	if (override_only & PCI_ID_F_VFIO_DRIVER_OVERRIDE)
> > > +		strcpy(alias, "vfio_pci:");
> > > +	else
> > > +		strcpy(alias, "pci:");  
> > 
> > I'm a little concerned that we're allowing unknown, non-zero
> > override_only values to fall through to create "pci:" alias matches.
> > Should this be something like:
> > 
> > 	if (override_only & PCI_ID_F_VFIO_DRIVER_OVERRIDE) {  
> 
> Should probably be == not &, since in this new arrangement it is
> really more of an enum than a bit flags... A switch would be OK here
> too
> 
> > 		strcpy(alias, "vfio_pci:");
> > 	} else if (override_only) {
> > 		warn("Unknown PCI driver_override alias %08X\n",
> > 			driver_override);
> > 		return 0;
> > 	} else {
> > 		strcpy(alias, "pci:");
> > 	}  
> 
> It seems reasonable to me to throw a warn, it signals to a future
> developer that kbuild is not working right.
> 
> > And then if we can only have a single bit set in override_only (I
> > can't think of a use case for a single entry to have multiple
> > override options), should PCI_DEVICE_DRIVER_OVERRIDE() be defined to
> > take a "driver_override_shift" value where .driver_override is assigned
> > (1 << driver_override_shift)?  That would encode the semantics in the
> > prototypes a little better.    
> 
> I think it is just an enum of overrides, no reason to make it one hot
> encoded. Previously when it was flags the bit encode had a certain
> amount of logic, but no longer.

Yeah, a switch statement handling pci:/vfio_pci:/warn rather than
testing bits would clear things up for me.  Thanks,

Alex

