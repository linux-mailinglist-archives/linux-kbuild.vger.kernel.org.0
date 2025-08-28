Return-Path: <linux-kbuild+bounces-8647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D61EBB3AB8E
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 816D6566BB5
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 20:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC90C211491;
	Thu, 28 Aug 2025 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MA0ULWAA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF321F9F73
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Aug 2025 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756412441; cv=none; b=kYmzUfQqp/8dy8v2ozGwNEZC7DgbaokPgS7Acy5wZpEt5WZvHdZvy9hnolDIUjcoTbkINtpIga56IJVK2cdkLV1e7u73E02okYO9LBJbxI3Nw7z4iHjwsV1VCYjs6Q56LwxJeJXMu/DUrAEfiRTJqN2XyrYnP1B6R26A1Z9wIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756412441; c=relaxed/simple;
	bh=wn1DfSJSzYEcG/LgwGZZlqO+LQzGOhMWhgsrPiCPOTU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JT4DJkSpxg3LZiTt7z77h1SxKU307c/JjHClx6AFP42GJF5sC78/jWcMdDgnPbgemNiLVWFRofYuIyOXZNWvtq4HdLgfOM8JJRj/Krtx5detjzzBH+JDYsKOTUWgG1lxkHBoZhJlFhwtkpWJY+prttgAtDPr0PmsvEqoqZwmPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MA0ULWAA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756412439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBxv6A2s/kChgSeU2uqW+ilh6uPyCrQbXOqlpuAJy+A=;
	b=MA0ULWAApInCrVP+D2QAigUI0uW0JjWlsyeCLrdbwudPOz+ZuCc/TDeB3keq1cnq9/rHGp
	oJjR1mkpyQRBhqs60ubuCpTIuyZyA45XUHiBvk3iNTtgRjTBZL4QYSQprNR/cTwb+UVmGk
	2ehSERBz20pg/4fv0u30oxa77QoM9zM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-jm1aCQvKMAyNN7xQmljqOw-1; Thu,
 28 Aug 2025 16:20:37 -0400
X-MC-Unique: jm1aCQvKMAyNN7xQmljqOw-1
X-Mimecast-MFC-AGG-ID: jm1aCQvKMAyNN7xQmljqOw_1756412436
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6920319560B3;
	Thu, 28 Aug 2025 20:20:36 +0000 (UTC)
Received: from localhost (unknown [10.64.240.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 683C8180047F;
	Thu, 28 Aug 2025 20:20:34 +0000 (UTC)
Date: Fri, 29 Aug 2025 05:20:32 +0900 (JST)
Message-Id: <20250829.052032.1082886658878770119.yamato@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: yamato@redhat.com, ldv@strace.io, alex.williamson@redhat.com
Subject: Re: [PATCH] vfio: show the name of IOMMU driver in
 /proc/$pid/fdinfo
From: Masatake YAMATO <yamato@redhat.com>
In-Reply-To: <20250828201729.3660771-1-yamato@redhat.com>
References: <20250828201729.3660771-1-yamato@redhat.com>
Organization: Red Hat Japan, K.K.
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Please, ignore my last post.
I should send the original message to linux-kernel@vger.kernel.org.
Sorry for making noise.

Masatake YAMATO

> The ops of VFIO overlap:
> 
>   (include/uapi/linux/vfio.h)
>   #define VFIO_DEVICE_GET_PCI_HOT_RESET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
>   ...
>   #define VFIO_MIG_GET_PRECOPY_INFO _IO(VFIO_TYPE, VFIO_BASE + 21)
>   ...
>   #define VFIO_IOMMU_DIRTY_PAGES             _IO(VFIO_TYPE, VFIO_BASE + 17)
>   #define VFIO_IOMMU_SPAPR_TCE_GET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
>   #define VFIO_EEH_PE_OP			_IO(VFIO_TYPE, VFIO_BASE + 21)
>   #define VFIO_IOMMU_SPAPR_REGISTER_MEMORY	_IO(VFIO_TYPE, VFIO_BASE + 17)
>   ...
>   #define VFIO_IOMMU_SPAPR_TCE_REMOVE	_IO(VFIO_TYPE, VFIO_BASE + 20)
> 
> These overlapping makes strace decoding the ops and their arguments hard.
> See also https://lists.strace.io/pipermail/strace-devel/2021-May/010561.html
> 
> This change adds "vfio-iommu-driver" field to /proc/$pid/fdinfo/$fd
> where $fd opens /dev/vfio/vfio. The value of the field helps strace
> decode the ops arguments.
> 
> The prototype version of strace based on this change works fine:
> - https://lists.strace.io/pipermail/strace-devel/2021-August/010660.html
> - https://lists.strace.io/pipermail/strace-devel/2021-August/010660.html
> 
> Cc: Dmitry V. Levin <ldv@strace.io>
> Signed-off-by: Masatake YAMATO <yamato@redhat.com>
> ---
>  drivers/vfio/container.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index d53d08f16973..03677fda49de 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -11,6 +11,7 @@
>  #include <linux/iommu.h>
>  #include <linux/miscdevice.h>
>  #include <linux/vfio.h>
> +#include <linux/seq_file.h>
>  #include <uapi/linux/vfio.h>
>  
>  #include "vfio.h"
> @@ -384,12 +385,22 @@ static int vfio_fops_release(struct inode *inode, struct file *filep)
>  	return 0;
>  }
>  
> +static void vfio_fops_show_fdinfo(struct seq_file *m, struct file *filep)
> +{
> +	struct vfio_container *container = filep->private_data;
> +	struct vfio_iommu_driver *driver = container->iommu_driver;
> +
> +	if (driver && driver->ops->name)
> +		seq_printf(m, "vfio-iommu-driver:\t%s\n", driver->ops->name);
> +}
> +
>  static const struct file_operations vfio_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= vfio_fops_open,
>  	.release	= vfio_fops_release,
>  	.unlocked_ioctl	= vfio_fops_unl_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
> +	.show_fdinfo    = vfio_fops_show_fdinfo,
>  };
>  
>  struct vfio_container *vfio_container_from_file(struct file *file)
> -- 
> 2.51.0
> 


