Return-Path: <linux-kbuild+bounces-2674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0E93D2DE
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 14:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C33A2830B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 12:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA1817B436;
	Fri, 26 Jul 2024 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NCdlv0Iu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E51779AB
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721996150; cv=none; b=LThLv/LhtaMRFZeH5mQv6M5MRHWs3IRIRVjhN4kkCv4YM9GWPhN22yFlzjlZSPg3xJH1DMgx1MT7TENx1lZDTKQ+ylFbkp+nz241YbHZVK9EWCcFibVQI2y+v4fR0rT+E2iKzKqeCnnJ2lqHkAP5IUOaUQmGp7rY2LwY36UHU10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721996150; c=relaxed/simple;
	bh=zpYoC0bKWO/E8vU/OfmKM5HXzkjJBLVwbnPHaL9Kgtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SiggbyUlFt/OUTzZMTKnexTLDEJyTQgwIMwbl5k7snF960XPq+mgNWI/CoDRnNdwDb4PkYxT/ILRr6XhXOPmrucO9IYiPpSH+aLeMjihQfOVauIn2iv1wKzWoIY2YMBzPhPtrnDDbb61WZhbBIoBA0QEXntNNw4G2EH8wkwJjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NCdlv0Iu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721996148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ia6UsEbsS9+W6Fb8WCpi2quyjabb0b4//2sWiMCJBA=;
	b=NCdlv0Iu6UnnB4SggiudQXLZTnmY438xjgugAWJ6U4jkYlNn8OkPuUzCBOGAmUg+qstTa7
	aHz8cFu0ANgRP/N1brztH3Qfi/pRc5AT4JiT2dzywPDKGU8P64+nJlYE1dNAFiEFXmy8+s
	4ppLsjbJs0A4S7P+8sHnJiZudj/N95o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-rheZr8p8M5O7cxbTjh0r_w-1; Fri,
 26 Jul 2024 08:15:42 -0400
X-MC-Unique: rheZr8p8M5O7cxbTjh0r_w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E10A1955D4E;
	Fri, 26 Jul 2024 12:15:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.105])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C75801955D42;
	Fri, 26 Jul 2024 12:15:32 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: andrew@lunn.ch
Cc: UNGLinuxDriver@microchip.com,
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
Date: Fri, 26 Jul 2024 14:15:26 +0200
Message-ID: <20240726121530.193547-1-jtornosm@redhat.com>
In-Reply-To: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hello Andrew,

> What this does appear to do is differentiate between 'pre' which will
> load the kernel module before it is requested. Since there is no 'pre'
> for this, it seems pointless whacking this mole.
Precisely, we need to fix the lan78xx case with micrel phy (and other
possible phy modules) too, due to the commented issue generating initramfs
in order to include the phy module. 

> What to me make more sense it to look at all the existing 'pre'
> drivers and determine if they can be converted to use this macro.
Of course, now that we have the possibility we can do this with other cases
that have been already detected (and fixed with a softdep pre) and others
still not detected (if anyone apart from lan78xx).

Thanks

Best regards
José Ignacio


