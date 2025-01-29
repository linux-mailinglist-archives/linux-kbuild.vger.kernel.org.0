Return-Path: <linux-kbuild+bounces-5566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15CA21ADD
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2025 11:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5CA188505E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2025 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2661A0712;
	Wed, 29 Jan 2025 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="2Zd45uWv";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="W/FukbNB";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="lrzTQRN3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i673.smtp2go.com (e2i673.smtp2go.com [103.2.142.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696A16C854
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Jan 2025 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738145859; cv=none; b=TQWgez8MlCfUPlrg0/98GwGhT0xYzljup9uzY3aGgDPz1/PzgTeqrN/Ach9w56UtBZVNfzhllI0DdsO7elVG7UO26D/72fYhgav71tA0uWJtgFFATjKa2XETF2+I8nZOSIKAqeonBdE44ZeEayEbTzJ2P8lmDv+PJ/+LuRGzaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738145859; c=relaxed/simple;
	bh=jlWqgjHL5N7f8oGkWcnw43c2Ps30GS7ts7AWiFMaylQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTJEI6lve1J6oh+wnfAt8FxL72ALomGzLvTpyTkwNY1/T7pzHaSKAI5arFCU3cKwIjqiGMPoyzuCmRLjsiQ8PHLeH9VZZGai9jT1D+txk5tUIdLGu9NGXPS7S8EZxQy/gPzcVARHlTobgB5Dk9R3kNebpfYyIxse9eqa/UAOcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=2Zd45uWv reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=W/FukbNB; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=lrzTQRN3; arc=none smtp.client-ip=103.2.142.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1738146747; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=yigIz8jogxLpu8Oq/ClpNGnqxPIg8HGpntMDN4L9js0=; b=2Zd45uWvQnl5jF85jM5LkjyFwQ
	KJJIMW9GUZhhuDuuZAiHHKIlpvoyh15/1B/39rrz++BNvSknp0GUlapRKbx///vldtKcHqKysmJtY
	pguNQLoSBUu+t9Gg2NkciJxHwW5sCb9kvTUFwinuRlBb0DMggsunsWUe/3xsD1eHlpkiuLB5bQ7MH
	CWsBu+D/wnMsqO7UwAL9eqlLahSUMHwqSj1d1w0WN2JZeNcqGwHqgb5lvKOljyJSs/w55j8GALfiY
	JgXV6y2Jr5hdLlUGTMC2gmkB7TLN0SL9W8Ka57aQgvvr2l+G6v1Zj1JCwsyTIkIg+2DnwqRapq0Or
	MoXC2amg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1738145847; h=from : subject :
 to : message-id : date;
 bh=yigIz8jogxLpu8Oq/ClpNGnqxPIg8HGpntMDN4L9js0=;
 b=W/FukbNBEN6laik2ijhCg6Ub0iF5/P/43u6Xn2D4R6/zDYUwlxgOeoGNbojcuE5sKmsJY
 4/s5Vua3ft5bUF8YyZ3kyjHERLPA7TkGilXga3eiiG4yxMdFMkaqFvboNTEfLRb85AL3fBR
 XK/2dwjdK88De81W5zdbuwq2oNFDrNaqmBeAupX36CgIUtlMMxsQDc+vjGmoQ1xsdf/zk+E
 NBO0pcTE3j6Q/yWAQbo7ANJjIuNQO5RYLgKI6mNSn12sNY2j913M6yqpU/9G4u6of10kjrU
 0cbLNeXZc46xiql3DznAbIkGmpeO5dczbeDhjqBkJBc+W2/DTGzGVhk73/Lg==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1td541-qt4C2u-7W; Wed, 29 Jan 2025 10:12:53 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1td540-4o5NDgrj3YX-m1RY; Wed, 29 Jan 2025 10:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1738145569; bh=jlWqgjHL5N7f8oGkWcnw43c2Ps30GS7ts7AWiFMaylQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrzTQRN3Tn32FaSlwxsLVco1eX3DaHzg6Z8TRjjS1WIaUVi4Si1yCo3WTUpJh8fdW
 F+PnOhw5lYOsXu+6n/Tv5PbAbEPZUx/dTzHK5fKxW0mkUPZj8xWlai41nC0rQG6uuT
 9SQHPfkpisMCnTaCynW2DaO4AAk9FNYX1ise4kDE=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 4C4DB3D90C; Wed, 29 Jan 2025 11:12:49 +0100 (CET)
Date: Wed, 29 Jan 2025 11:12:49 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Kienan Stewart <kstewart@efficios.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.org>, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, n.schier@avm.de
Subject: Re: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
Message-ID: <Z5n_Iei185SsQyLd@fjasle.eu>
References: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
 <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
X-Operating-System: Debian GNU/Linux 12.9
X-Smtpcorp-Track: ZTBT3cb1amra.Jb1e2hKYeZBl.0LqavQC3jtm
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sjo3cYpwpr
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Tue 28 Jan 2025 10:53:42 GMT, Kienan Stewart wrote:
> Hi,
> 
> I missed a few CCs, looping them in now. Apologies for the extra noise.
> 
> thanks,
> kienan
> 
> On 1/27/25 1:47 PM, Kienan Stewart wrote:
> > In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> > ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> > artifacts required for building out-of-tree kernel modules had
> > $(objtree) prepended to them to prepare for building in other
> > directories.
> > 
> > When building external modules for powerpc,
> > arch/powerpc/lib/crtsavres.o is required for certain
> > configurations. This artifact is missing the prepended $(objtree).
> > 
> > External modules may work around this omission for v6.13 by setting MO=$KDIR.
> > 
> > Signed-off-by: Kienan Stewart <kstewart@efficios.com>
> > ---
> >   arch/powerpc/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d36155cc61ab4460c7 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
> >   # There is a corresponding test in arch/powerpc/lib/Makefile
> >   KBUILD_LDFLAGS_MODULE += --save-restore-funcs
> >   else
> > -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> > +KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
> >   endif
> >   ifdef CONFIG_CPU_LITTLE_ENDIAN
> > 
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83

Thanks!

Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>


