Return-Path: <linux-kbuild+bounces-5243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31B9FC60A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 17:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44E77162EB4
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6516143725;
	Wed, 25 Dec 2024 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Ow8u+e5O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB12F22;
	Wed, 25 Dec 2024 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735144037; cv=none; b=a0N8jj47q9TpdA2bQ7VAOrvPFr3VFCP0vbPCpsrOhHD+XuMezawhtLIefDb8k2K2CajRvD6/s4+Ir6rxJQQDBujdh6IezUsa+eS5EoHTik0KrN+hgG1sdKVZKzsWxXeeW5C6ipKqCylMl8m2EYSKlTrzlG/Ydp0CAkFFvw4XdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735144037; c=relaxed/simple;
	bh=F9bKtvF4xJ+raJIqDOf7pKVRTUGWuzTCGtVyaqNBWFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJ98QdQswILKsLaGVhGUnCl/ZNI2k3yXlYEZRX2xtxzK4VxY1buznSRQE6on3Wns68C6LbOuufFg7T/t85uWivZy2L36UiQYcbGcVu3TxfqwYHHIMuduueMVbItRaYhEmkgLVfpAPeKGm5+lz/MOnaqb7qMJDpwdgyCn2v+nvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Ow8u+e5O; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CRslhLEPtAMorBU7nJn0YFY7DN9gOft5QH4shR1qNYE=; t=1735144033; x=1735748833; 
	b=Ow8u+e5O0IG6eOXbm/0sUWTgWv/yRb2EY1DQAGTcFFzy/lkHqy/oTWaCT4TJ1AfHb7N87wWcjGx
	UHR/vJGO3SCyQepBcbWRTdyusSfK6pZsFn/nHMoZ7LldmQejBnGTPQN87fCXPiFl0i15m/JMbeqE+
	hqsfVB4SSp62tdqnqbwXBwLnUtSgt7jCbBrQFm267Yhpkixz0bCiNdc7a/9NevSWNcDPykx3hD/Jy
	AmSDvLSdbUB85yYzajLxsouJ5/zazW7C7lKvHdsJQ+nxLmGNZYoc/u6xj07h8hiazRyLcepB1wp+9
	UnsjzzKGHcMcff9kjJl07Ahknry8+g5y4k5Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tQUDv-00000000XYQ-1yRn; Wed, 25 Dec 2024 17:27:03 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=z6.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tQUDv-00000001K9O-0vzn; Wed, 25 Dec 2024 17:27:03 +0100
Received: from glaubitz by z6.fritz.box with local (Exim 4.96)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1tQUDu-0006ym-2S;
	Wed, 25 Dec 2024 17:27:02 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: masahiroy@kernel.org
Cc: gregkh@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	rusty@rustcorp.com.au,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] modpost: work around unaligned data access
Date: Wed, 25 Dec 2024 17:26:56 +0100
Message-Id: <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Masahiro,

> The latest binutils stopped aligning section data in relocatable ELF.
> It saves small number of bytes that were previously inserted between
> sections. However, modpost crashes due to unaligned access:
>   https://sourceware.org/bugzilla/show_bug.cgi?id=32435
>   https://sourceware.org/bugzilla/show_bug.cgi?id=32493
>
> Similar to kernel space, unaligned data access in userspace can be
> problematic on some architectures.
>
> Simple example on ARM:
>
>  $ CC=arm-linux-gnueabihf-gcc
>  $ echo 'int foo(int *p) { return *p + *(p + 1); }' | ${CC} -O2 -x c - -c -o foo.o
>  $ echo 'int foo(int *p); int main(void) { char str[16] = "helloworld"; return foo((int *)(str + 1)); }' | ${CC} -x c - -c -o main.o
>  $ ${CC} -static -o unalign-test main.o foo.o
>  $ qemu-armhf unalign-test
>  qemu: uncaught target signal 7 (Bus error) - core dumped
>  Bus error (core dumped)
>
> In this case, the 'ldrd' instruction causes a bus error due to an
> unaligned access. If the -O2 flag is omitted, this issue does not occur.
>
> To avoid potential unaligned access, use the get_unaligned() approach
> as seen in the kernel space.

I have just applied this series against Linus' tree and I can confirm that it fixes the
unalignment access anymore on sparc64. There is no more "Bus error" and the build succeeds.

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Thanks,
Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

