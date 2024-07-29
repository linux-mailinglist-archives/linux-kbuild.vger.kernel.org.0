Return-Path: <linux-kbuild+bounces-2724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD193F573
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 14:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3E61F224C0
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 12:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A634F146585;
	Mon, 29 Jul 2024 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYKlgrDD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C3144D10
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256381; cv=none; b=b93wqF8+9ZsAsasSmRXLhp+gy70WKJTqaRX4+xUo4qJ3gXEDcbBEwcJHrvg8o+5ZQHxNJ8WJHWM2UmqpCDQdyrx+cP9Qki++LMoEa/sJtYRy6HA2jls87VCVBjJRI0p9a9ond976i5ehbtsJGHl2oUEVk0T/JDJI/dnIHEX2B0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256381; c=relaxed/simple;
	bh=OZ5jXVlwnFT9jWJUdVRr5iRq5783wksRo2iASegfAXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOsZMAQBwTd8p65vs+/hrng+I3wwIs97/uAde7j4rR9Nue5ddg2cxOK/VEOUwabpRSorWT1d9rYXF5OP0z0Z5CaJ4w3nTqFTZFPW2Gep5p/31oDdEWghL3ZLPzvAA1umboR6p2L3clXr0Fs9CoVW+4dDgGFYbp+Jdts/0yhD9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYKlgrDD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722256379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0xks81TdKZTJ22FJnbrdp5glJu0PgYtd3j9EKuYo38=;
	b=EYKlgrDDCBXXU9SAqObC9jPSnhbfHcfKkYCYdTgu7WWv1UaeGjtOVtICI2HIB91quy9HdB
	ZleG8h+bwvKdCkW6jB6AiTuWZT0cWLOuUdGCIosz2zaAowY4UjfUeOhWPn2yq2oX51UNLm
	2IUa5yd42ECB3ik/h1ZV/qAylbiIYMk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-86vu1Qi1ODmH9Ngj9XTfXw-1; Mon,
 29 Jul 2024 08:32:56 -0400
X-MC-Unique: 86vu1Qi1ODmH9Ngj9XTfXw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8202919560AA;
	Mon, 29 Jul 2024 12:32:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.136])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45AAA1955D47;
	Mon, 29 Jul 2024 12:32:46 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: dsimic@manjaro.org
Cc: UNGLinuxDriver@microchip.com,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	f.fainelli@gmail.com,
	gregkh@linuxfoundation.org,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	lucas.demarchi@intel.com,
	masahiroy@kernel.org,
	mcgrof@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy module
Date: Mon, 29 Jul 2024 14:32:43 +0200
Message-ID: <20240729123244.18780-1-jtornosm@redhat.com>
In-Reply-To: <4db38805936d28fe1578c525a18f7849@manjaro.org>
References: <4db38805936d28fe1578c525a18f7849@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hello Dragan and others,

> I see and agree, but please note that other people highly disagree about
> that being an issue at all.  Thus, I'd suggest that you provide a 
> detailed
> explanation of why and how that presents an issue that weakdeps solve.
I think that the problem that I am trying to fix related to initramfs
generation is understood. At least what I tried to explain at the beginning
of this thread with my messages and the help of Lucas. But maybe you are  
right, so let me provide a more specific explanation.

The only thing that I could repeat and/remark is that I am not modifying
anything in the current kernel behavior, and specifically for this case 
(lan78xx) with a network driver and related phy modules: I am just trying
to add a flag (and nothing else) to complete the information of the
necessary modules to be collected by the tools that build the initramfs.

And if this information about the necessary modules is not correctly
collected, the kernel is not going to work from initramfs, Especially if
the network drivers are not working (because the phy module is not found),
some initial and necessary resources could not be available before and
after initramfs stage, because unless the network driver is unloaded and
loaded again after initramfs stage (then the phy modules would be available
from rootfs), it is going to be in the same situation, that is, not
correctly initialized and not working.

Including in the initramfs all the phy modules is an option but I think it
would be better to include only the necessary stuff (this is the default
behavior for the tools that are used to build the initramfs). This is valid
for embedded and not-embedded systems.

If this patch, to only add the related flag of the network driver to inform
about the possible phy modules, is rejected because a more general solution
is preferred, I would like to dig into it, at least to know if it is possible
to do better.
Maybe Andrew in other part of the thread, after the interesting comments
from Jakub, can help and provide some new (for me) inputs.

> Regarding Lima and Panfrost, I agree that weakdeps are a better solution
> than softdeps, but please see also harddeps. [1]  I'd appreciate if 
> you'd provide your opinion about the proposed harddeps.
> [1] 
> https://lore.kernel.org/linux-modules/04e0676b0e77c5eb69df6972f41d77cdf061265a.1721906745.git.dsimic@manjaro.org/T/#u
Ok, I will think more about it.
After a quick first look I agree with Lucas, but let's go little by little
(at least I don't have a lot of time before my holidays). 

Thanks

Best regards
José Ignacio


