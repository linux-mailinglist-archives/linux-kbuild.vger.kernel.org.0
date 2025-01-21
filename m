Return-Path: <linux-kbuild+bounces-5527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8196A1879A
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 23:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ECBF16834A
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 22:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4FE1F7080;
	Tue, 21 Jan 2025 22:12:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADC1B041B;
	Tue, 21 Jan 2025 22:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737497523; cv=none; b=XHgNqSZpW3wpf0KA5bG0eEzSZpIDoVYi0qznCkB4N1pFrZWRvcgFTlpfSBqEav+KPNoa/3cirLWNS17Wh+3IEFbkg6YaaL+TIGs0c8Z7FL47A49+v9F8cMW1LKpKBcwpFpzgSYPJY6riu/D8n7wdPvh3yHZhXM+/AnbKrsvw/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737497523; c=relaxed/simple;
	bh=ozW20dgpJo+yKHTw8q9FJMdahbitrTcO+Wp6jwFc2lI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fPE/oPutapmfOjunS3bJAl9iuwrw4E2ro50HPrM7rDO76B1DEeEZ/lFu6f7NFnCrGToyFpJERi1TISPjOWBFWgXjIml7Nw7A3Cq/hS/LM2Qmdg7E9/BwFBlzPyLMk+dpxDx9mpp2hdfOvf8JCFY8d4Dl3X0nlSIUgg/JusbUkFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BF839340BEA;
	Tue, 21 Jan 2025 22:11:59 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,  Masahiro Yamada <masahiroy@kernel.org>,
  Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  arnd@arndb.de,  linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
In-Reply-To: <20250121215330.GB1517789@ax162> (Nathan Chancellor's message of
	"Tue, 21 Jan 2025 14:53:30 -0700")
Organization: Gentoo
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
	<20241118205629.GA15698@thelio-3990X> <8734joj5gn.fsf@gentoo.org>
	<20241119041550.GA573925@thelio-3990X> <87r077j1fa.fsf@gentoo.org>
	<20241119044724.GA2246422@thelio-3990X>
	<CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>
	<202501201615.F606516@keescook> <20250121215330.GB1517789@ax162>
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Tue, 21 Jan 2025 22:11:56 +0000
Message-ID: <877c6n24wj.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nathan Chancellor <nathan@kernel.org> writes:

> On Mon, Jan 20, 2025 at 04:16:30PM -0800, Kees Cook wrote:
>> On Wed, Nov 20, 2024 at 03:28:35AM +0900, Masahiro Yamada wrote:
>> > Some Makefile overriding KBUILD_CFLAGS would forget to add
>> > $(CSTD_FLAG), for the same reason as they would forget to add
>> > -std=gnu11.
>> 
>> But at least we'd have 1 place to change when we changed the std level.
>> 
>> FWIW, I just ran into this build failure too testing GCC 15 from their
>> ToT. Both EFI and compressed Makefiles needed it in my build.
>
> Yeah, I suggested the simpler diff in a separate thread, which seems to
> agree with your testing:
>
> https://lore.kernel.org/20250120182048.GA3244701@ax162/
>
> I don't mind drafting up a commit message and sending those along if
> that would be preferrable.

At this point, I'd like to see the scattered -std= in given it seems
less objectionable, even if I'd prefer one place, as we already missed
one release being GCC 15-buildable. Happy to test/ack it if you're willing to send it.

thanks,
sam

