Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F0A3F7E29
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 00:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234816AbhHYWGh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 18:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27385 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229707AbhHYWGg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 18:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629929150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9bzdPdbfmLgeq8dXUQB3sYM02KhzqlIwyVi1sq5m3r8=;
        b=VJnLL38O49XMrj/PZZfU+c/jwtb49k8r6PomE+zAC+S2KVaxs6HhvNrHfkF/iiRDsIhx9y
        P9IWsfDcxOk7M3Vnl5l20LqPDmf9uwllO/1s+Zr05frF9fkEc+dJfXA0DKbnh/53F6hsyX
        +Apx0njxoLM8snZOQDH30ZWI0pK/3sU=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-BqR0NNvNMoedUd28Bfda6A-1; Wed, 25 Aug 2021 18:05:49 -0400
X-MC-Unique: BqR0NNvNMoedUd28Bfda6A-1
Received: by mail-ot1-f72.google.com with SMTP id y6-20020a0568302a0600b00518b08df4d2so282809otu.13
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 15:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=9bzdPdbfmLgeq8dXUQB3sYM02KhzqlIwyVi1sq5m3r8=;
        b=VWhLYZ0f5LA8qBQcWLaN14heW/+EvEVSLX9+YALAEpwTXjcfOUQagYuQm+R4CTfVHv
         Ns5kW6zqojKHTm6qKUm+FaH74e78Q+McL9M6Q67Vgo2uJazll/anBH3LYQpchmOuTXsK
         Dn7z2rG0yCbSflRWVIZQ5KbdxO+tqyJmwk56ULjQFZI82cUVYKPIw2dMm1vEFjaiLoHV
         L6vqAr3TWD7NR9pd+PKN9byZtoM1tXJwp1nDG6d3b+OWnf0dnxDSqGh9KAlO3DEKwiqs
         3fDS1oshUdYmkil2ttYXmARdZcu37GBsdeeCBbYk/mC+4odSaDwAiIKRhV4JMAP8+Y9L
         Fo9A==
X-Gm-Message-State: AOAM531Y2HIhLkruO2/hEddK4ZevGQRpwUDvd14cFfKyR2jS6PyNgB6U
        RiSaBmS3SlWU7Z69R/iCiD+8oq0QRSfkOTEFrTrnTkn/v7NjQ1VKjHW/vEbfkLt/OnIEUDHlkh/
        pyKCkMrCNER++hDQARuqFBDgF
X-Received: by 2002:a54:450b:: with SMTP id l11mr8671639oil.116.1629929148299;
        Wed, 25 Aug 2021 15:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBPtV6CuqHqtqxC3bi9fduSn7Z2NGiUT0Qa4bHqAHrOYoWOX545z6m1qYxokoWHNK1MtiyiA==
X-Received: by 2002:a54:450b:: with SMTP id l11mr8671630oil.116.1629929148116;
        Wed, 25 Aug 2021 15:05:48 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id f3sm237418otc.49.2021.08.25.15.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 15:05:47 -0700 (PDT)
Date:   Wed, 25 Aug 2021 16:05:46 -0600
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
Subject: Re: [PATCH V4 10/13] PCI / VFIO: Add 'override_only' support for
 VFIO PCI sub system
Message-ID: <20210825160546.380c0137.alex.williamson@redhat.com>
In-Reply-To: <20210825135139.79034-11-yishaih@nvidia.com>
References: <20210825135139.79034-1-yishaih@nvidia.com>
        <20210825135139.79034-11-yishaih@nvidia.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 25 Aug 2021 16:51:36 +0300
Yishai Hadas <yishaih@nvidia.com> wrote:
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 7c97fa8e36bc..c3edbf73157e 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -426,7 +426,7 @@ static int do_ieee1394_entry(const char *filename,
>  	return 1;
>  }
>  
> -/* Looks like: pci:vNdNsvNsdNbcNscNiN. */
> +/* Looks like: pci:vNdNsvNsdNbcNscNiN or <prefix>_pci:vNdNsvNsdNbcNscNiN. */
>  static int do_pci_entry(const char *filename,
>  			void *symval, char *alias)
>  {
> @@ -440,8 +440,12 @@ static int do_pci_entry(const char *filename,
>  	DEF_FIELD(symval, pci_device_id, subdevice);
>  	DEF_FIELD(symval, pci_device_id, class);
>  	DEF_FIELD(symval, pci_device_id, class_mask);
> +	DEF_FIELD(symval, pci_device_id, override_only);
>  
> -	strcpy(alias, "pci:");
> +	if (override_only & PCI_ID_F_VFIO_DRIVER_OVERRIDE)
> +		strcpy(alias, "vfio_pci:");
> +	else
> +		strcpy(alias, "pci:");

I'm a little concerned that we're allowing unknown, non-zero
override_only values to fall through to create "pci:" alias matches.
Should this be something like:

	if (override_only & PCI_ID_F_VFIO_DRIVER_OVERRIDE) {
		strcpy(alias, "vfio_pci:");
	} else if (override_only) {
		warn("Unknown PCI driver_override alias %08X\n",
			driver_override);
		return 0;
	} else {
		strcpy(alias, "pci:");
	}

And then if we can only have a single bit set in override_only (I
can't think of a use case for a single entry to have multiple
override options), should PCI_DEVICE_DRIVER_OVERRIDE() be defined to
take a "driver_override_shift" value where .driver_override is assigned
(1 << driver_override_shift)?  That would encode the semantics in the
prototypes a little better.  Thanks,

Alex

>  	ADD(alias, "v", vendor != PCI_ANY_ID, vendor);
>  	ADD(alias, "d", device != PCI_ANY_ID, device);
>  	ADD(alias, "sv", subvendor != PCI_ANY_ID, subvendor);

