Return-Path: <linux-kbuild+bounces-2737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5AE940A73
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 09:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5E21F242AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 07:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151D6191F91;
	Tue, 30 Jul 2024 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JADKkWZH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D7191F61
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326154; cv=none; b=ckkw6ksIr9ZSZuaJR/iWHUdgaMxpXSwcIprbanJyQd/gfVmovUlbkEuiLDYfctPYIPoVnVGQvsRuob+XGzlb8MX80SkYg5PGbURE35ozvpcQ0ISM6SkAyBik6DiZvE+yp+yX3WvQVtfdj7rgq5IRwkxPnr6+kmCxf9+xppTlg1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326154; c=relaxed/simple;
	bh=pUneXqc1tawiKl8hOSNTSHjlMaasizdprX1F4ta/+GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYHFg8M0hFTIYuH2w7DlHZIiQUc0Vhm4Z6lyEBWEqh744oe5eNx2JWNaLIOjIVCEN1YCR8iJifLKGV4PsoAyt9yQFK55ptXUNscGL/j4/jhaowtl2cUN9aILZXEGwxAv8xDwhG+vsfCKIHtWSrlwCFpbL0Yf4EMKIe5oPy7PYsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JADKkWZH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722326151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeZf4S2zN1755hAgpbxKY28IpphydX1J+Zavqe1s4gs=;
	b=JADKkWZHMMZSP7JkqJOcimBHaBWbdtgkvsSCs5WErs676CWIr8YAUbTQNKNuLX71nS9Z+C
	UOuwNRXC0w0pvPiQBdu8SIMYVL4aCgiwwvlNGA/AC92uMwbb9WnUVtmM1E+R/FMwamqMfu
	U+nqAmPYcLqI1VXDQwy7Vzc69r3LVtw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-sCGQKRjSPciPX4Akn3WraQ-1; Tue,
 30 Jul 2024 03:55:41 -0400
X-MC-Unique: sCGQKRjSPciPX4Akn3WraQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D82481955D45;
	Tue, 30 Jul 2024 07:55:38 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.141])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 64D5119560AA;
	Tue, 30 Jul 2024 07:55:31 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: andrew@lunn.ch
Cc: UNGLinuxDriver@microchip.com,
	davem@davemloft.net,
	dsimic@manjaro.org,
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
Date: Tue, 30 Jul 2024 09:55:28 +0200
Message-ID: <20240730075529.8263-1-jtornosm@redhat.com>
In-Reply-To: <c8450f9c-a7f8-4775-8d26-7a070aa68e4d@lunn.ch>
References: <c8450f9c-a7f8-4775-8d26-7a070aa68e4d@lunn.ch>
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

> So are you saying current initramfs are broken, because they don't
> include the needed PHY modules?
I am just saying that the default initramfs including the current lan78xx
driver is broken because in this case there is no information to collect
the possible phy modules. And as I commented, after the complete boot, the
only solution is to unload and load lan78xx to get the phy module from
rootfs.
 
> You can fix one example of the lan78xx
> USB dongle, but are going to leave everything else broken?
My intention was to fix the case for lan78xx because it is the one that I
have detected that does not work. Others are already working, for example
r8169, by means of a softdep with realtek phy. And my idea was to do the
same for the other detected/needed, if any (I am not aware of other similar
reported issues).
I see that you prefer to fix all the cases and always including all the phy
modules would solve the problem for lan78xx and for other possible ones.
But take into account that we should also try to avoid creating large
initramfs if not necessary, at least, if there is anyway to solve this.  
Indeed, if I am not wrong, only some phy modules are possible for
a driver and these are known.
Anyway, as it was suggested, we can explore some automatic procedure to
identify the hardware and with that, select the phy module or at least,
reduce the number of phy modules to introduce.

Thanks

Best regards
José Ignacio


