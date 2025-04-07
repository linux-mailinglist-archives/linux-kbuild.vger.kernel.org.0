Return-Path: <linux-kbuild+bounces-6483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A4A7D80B
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 10:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D082A3A9027
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 08:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B32A229B05;
	Mon,  7 Apr 2025 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="p3ZDc9J5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eCG5Timy";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="p3ZDc9J5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eCG5Timy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F9228C9D
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Apr 2025 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014873; cv=none; b=K0dw/Him53vGMg6Q3O/WNA7c0HnJL8qHJT79FLT1sNc1MPwTKV0cdwdFY3OZzgLSScoRmwmJjsKniV8uQoA/T8zusXh0Dcix+9H1GkiMrHmIcxRzRZf2kEmJMPXUdu9dIh6PLuAK7xa/Z6cZ51RGXeElCVvQFxzfIKlyITVkh4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014873; c=relaxed/simple;
	bh=A6qh3Sgw7ouHvHGBVuDPdJ17QgVL3yJ+i8GQjDO+UXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frYWHTmkZavNSlSXE0q+2wzbWhsPCjseCVnxMyCJJYEV6nz3an1/0RCozL04+wsVdhOxuueeX0txofRccPElB9dbxZFn8EZU0GSUh95j2luy7yWYgVNSwTY4ArjSB1jNxMj5LkQlXG/fuJOBfcDW0kBwf8Vii7IlO7JSk+qqU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=p3ZDc9J5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=eCG5Timy; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=p3ZDc9J5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=eCG5Timy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C4BC1F38D;
	Mon,  7 Apr 2025 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744014869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nACja8aKkopWKSDW7ThN2Ck/XWjNZp8gsrX/0bfmumM=;
	b=p3ZDc9J58BpkE3PjiND2CoE8vvcUgVl2js9A1++CsgCyRSZ3IrFEi+GAL9nPLtMAdZEOd6
	cjzTd9i5wVeG8kVaa4+45GAO9itAoR1eYPnVYDOv+beGned6IAJoJPsIiquZd5fPoZAF9B
	ZOQag8KOsQoppwKXc57tqE+NmyBbaTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744014869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nACja8aKkopWKSDW7ThN2Ck/XWjNZp8gsrX/0bfmumM=;
	b=eCG5Timy1vcrphnKlLEONd0X0ZdtNUETWamDJw6Zad+2n/O/FVrQ29UaFNUdDqWvy2Lqpg
	qrV5VbzergPSJLAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744014869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nACja8aKkopWKSDW7ThN2Ck/XWjNZp8gsrX/0bfmumM=;
	b=p3ZDc9J58BpkE3PjiND2CoE8vvcUgVl2js9A1++CsgCyRSZ3IrFEi+GAL9nPLtMAdZEOd6
	cjzTd9i5wVeG8kVaa4+45GAO9itAoR1eYPnVYDOv+beGned6IAJoJPsIiquZd5fPoZAF9B
	ZOQag8KOsQoppwKXc57tqE+NmyBbaTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744014869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nACja8aKkopWKSDW7ThN2Ck/XWjNZp8gsrX/0bfmumM=;
	b=eCG5Timy1vcrphnKlLEONd0X0ZdtNUETWamDJw6Zad+2n/O/FVrQ29UaFNUdDqWvy2Lqpg
	qrV5VbzergPSJLAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87B8913691;
	Mon,  7 Apr 2025 08:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wC3UIBWO82fwLwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 07 Apr 2025 08:34:29 +0000
Message-ID: <bb3d1391-d155-4e83-9103-818cd1a82c66@suse.cz>
Date: Mon, 7 Apr 2025 10:34:29 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Kbuild updates for v6.15-rc1
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Damian Tometzki <damian@riscv-rocks.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>
References: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
 <01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
 <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 4/6/25 18:50, Linus Torvalds wrote:
> On Sat, 5 Apr 2025 at 22:43, Damian Tometzki <damian@riscv-rocks.de> wrote:
>>
>> i got the following error after this pull request.
>>
>>  MODPOST Module.symvers
>> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>> make[3]: *** [/home/damian/kernel/linux/scripts/Makefile.modpost:147: Module.symvers] Error 1
>> make[2]: *** [/home/damian/kernel/linux/Makefile:1956: modpost] Error 2
>> make[1]: *** [/home/damian/kernel/linux/Makefile:248: __sub-make] Error 2
>> make[1]: Leaving directory '/home/damian/kernel/build'
>> make: *** [Makefile:248: __sub-make] Error 2
> 
> I think I'll downgrade the error() to a warn() again, and make
> SLUB_TINY depend on !COMPILE_TEST.

Ack, thanks.

> And I'm not even convinced we should require module descriptions for
> silly test modules, but whatever.
> 
> We'll see if something else pops up, but making the lack of a module
> description a fatal error was clearly not right as-is.
> 
>               Linus
> 
> [*] In fact, I'm not convinced SLUB_TINYT ever makes sense at all, but
> that may be too unrelated to this to worry about.

Back when it was introduced, it allowed removing SLAB without breaking some
particular small systems, so I'd say it was worth it :) But since the
savings are mostly coming from not allocating for performance rather than
the disabled code size, we could probably easily turn it to a non-intrusive
boot option and not regress anyone.

