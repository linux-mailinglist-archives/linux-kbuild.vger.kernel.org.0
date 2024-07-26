Return-Path: <linux-kbuild+bounces-2677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82993DA0F
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 22:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0CC2843AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 20:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F8E149DEF;
	Fri, 26 Jul 2024 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2bRlEyC2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D5EFC1F;
	Fri, 26 Jul 2024 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722027578; cv=none; b=my7Qu01u1bpf50KLtuqLPnqtulFuM3XigUL5xsNHAz8oROcEhzKirvMWKDw0lVSS+6y6SjpI23cdrt1gXAAxLVLLOBtQ3485uVc6zG6oQXNzRtV6T44v0VExKmz+UJwq6oe7WiX/brcV5AVRPoJmSP6QY6XgFH26V2eQgZrzfLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722027578; c=relaxed/simple;
	bh=utTWMDRHbjBrE41ZfyrJAwGAutTPl8oJN/Mb/6ikKYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jrk622eIuqfXxKmm0eReSQXwoofmyngXRGm/9f8y4qg8SCzg1PqGv2ejDUuJz14FaqkYUTYCQVsyxbVYQNJOWONNqbYXyTMDjj0VxSKNeXT3ku+6xqAdeN/Ceh7VeONiSMIhDp0Dz43HKhowyt7eher3fMN4EfOBM+MRxUnFb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2bRlEyC2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/j/pudLgRzFr7E806i9zApBDUDWPME45ID1EpjVKzVU=; b=2bRlEyC2ayrY5wMFVAMo4PP9zR
	n57YVloNpvCenv+VxlRVDYq7UMQ/IWy0xGCIQtalPrdtjQ37fDPLzYBwAYOLuvUFRffi0sHqRQoAS
	si0i3+6RoYNA9ur/OqPzQWMHDGPiyOGjFp+/eMdRh/m4kgNmw7CtMiuKXAMSEbSwPxpw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sXS23-003JBC-7v; Fri, 26 Jul 2024 22:59:19 +0200
Date: Fri, 26 Jul 2024 22:59:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
	f.fainelli@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, lucas.demarchi@intel.com,
	masahiroy@kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
Message-ID: <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726121530.193547-1-jtornosm@redhat.com>

On Fri, Jul 26, 2024 at 02:15:26PM +0200, Jose Ignacio Tornos Martinez wrote:
> Hello Andrew,
> 
> > What this does appear to do is differentiate between 'pre' which will
> > load the kernel module before it is requested. Since there is no 'pre'
> > for this, it seems pointless whacking this mole.
> Precisely, we need to fix the lan78xx case with micrel phy (and other
> possible phy modules) too, due to the commented issue generating initramfs
> in order to include the phy module. 

I still don't see how this solves any issues with generating the
initramfs.

There are more than 200 Ethernet drivers, and around 75 PHY
drivers. If this patch is merged, you have one MAC driver indicating
it needs one PHY driver. There is nothing much you can do with that
information. You need to wait until 99% of the MAC drivers indicate
which PHY drivers are needed. Then you can use this information leave
out any PHY which is not needed, and hope you only break a small
number of devices. But even if you wait 20 years i doubt you will get
99% of the MAC drivers indicating what PHY drivers you need.  Because
nothing really uses this information today.

So as far as i see, this has nothing to do with building the
initramfs.

	Andrew

