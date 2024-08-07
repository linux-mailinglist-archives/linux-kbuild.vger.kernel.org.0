Return-Path: <linux-kbuild+bounces-2893-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4194ADC8
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 18:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7987EB20B00
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 15:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F712C7FB;
	Wed,  7 Aug 2024 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="o1McUFKd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB2328B6;
	Wed,  7 Aug 2024 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723045593; cv=none; b=DbGz1Xof+6OcXJG8o/hEkjZeBGwcHA/ATmJuVsBNiqbk7Hjs9SGPh1IzzBI4WZrwJvUNs7WkQTohkILsPlFKSMJWT41hpwVKLVn8j9ULrqX6YgsQuoMMUOj5mOUMfRK7WlZa1iwRr1FcUZaMupVqn2QQ8XlybFAXEp9ddSqPTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723045593; c=relaxed/simple;
	bh=WkjDwC4CFCv0LVS9cZM3iibbxyO2Ccq1c0HnYlPk47E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBi1+pByu/BqUGWLvjSOhdPLeu92nN5O0r4eguGdNo36euBILRoUbiDGzZX1LoR13tLEqPaLrGLt/5idBzsj4UPtXbQ3Yw12FQUOaYc7zUSoNJUxQoxDL4QaByoZqtRbThbIV0sknsqSNilvpskxpndm0crBVMeKTFKOUdUWWJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=o1McUFKd; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tRmMETb/7MTV1QXR0Clr7A+ZjYv8xAw5xIefPC+Km8g=; b=o1McUFKdqARZXK+LGc9Xon/OZZ
	24j/7x3GXKWGNfkEijI/F8U6fj8xMFo4kzPtc02UVpxP/9N5m+G28WExZpe40/56wiEHmKryaosKu
	EI8vksXXSuHrdEdJyavO66yj+Q+iq5X61CAX+NpaFRz5Yctg1tZzEhLE8yVCiRGjvJCUEPvRw/kn2
	krVT44JnJFYYLntaxgYdTdB8i96vi4blU1il/nO9xT0wcZmtYUfGNu5xWr/iOqDbQcAwnPhvYcR0f
	V/mhK4W4QCFjIHOd/mU0855K6DFdc3PhyEI0xpV34am+jwnN3OV7rNwUtJ8vK7AWp3bf/aB+4CqZ+
	Pax12xQQ==;
Received: from [2001:9e8:9f8:5201:3235:adff:fed0:37e6] (port=37118 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sbirg-009hPI-OI;
	Wed, 07 Aug 2024 17:46:16 +0200
Date: Wed, 7 Aug 2024 17:46:03 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"speakup@linux-speakup.org" <speakup@linux-speakup.org>,
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Finn Behrens <me@kloenk.dev>,
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
	"gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
Message-ID: <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh>
 <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024080720-skyline-recapture-d80d@gregkh>

On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > Also, as this is not internal for the kernel, but rather for userspace
> > > builds, shouldn't the include/ path be different?
> > 
> > Can you suggest an alternative path or provide documentation that could help
> > identify the correct location? Perhaps usr/include?
> 
> That is better than the generic include path as you are attempting to
> mix userspace and kernel headers in the same directory :(

Please keep in mind, that usr/include/ currently does not hold a single
header file but is used for dynamically composing the UAPI header tree.

In general, I do not like the idea of keeping a elf.h file here that
possibly is out-of-sync with the actual system's version (even though
elf.h should not see that much changes).  Might it be more helpful to
provide a "development kit" for Linux devs that need to build on MacOS
that provides necessary missing system header files, instead of merging
those into upstream?

Kind regards,
Nicolas

-- 
Nicolas

