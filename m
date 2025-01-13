Return-Path: <linux-kbuild+bounces-5472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD1A0C1AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 20:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C451622AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 19:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7CA1C760D;
	Mon, 13 Jan 2025 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="g4iNwX7A";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="g4iNwX7A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657A1C726D
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797094; cv=none; b=aWajHSeXIuDZMEbg7s17EsTtK2zvXPkT0utkjPiMDX8c8wpaDxEBZDHmDK7BfwEIV94ioI5MalsUrhYVI90ho6z42gT6KvOysEAqBoYMbTXRo6UsJK7KevXEvorD1g7l19Qw05gs9T61GKgF0pEzinprA3hfBX3mNmfLyvxto6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797094; c=relaxed/simple;
	bh=WTjeQ/c9o9Abpl3ISgJVDLspwNQmp1sAYXW2mtscVD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRBhZfEIdOi14pGdG9yTICR7nXG/+rmWRLiwMjrwKdJ99meAT0MTSW+P3JIi2MlYSHjCk3pDYNG+L4rXKGDP4KoyFvSSpHgCV64yrMkeut2LYCt0O2gaFzdxsh7q96YvhU6afe7FB6lN9hf1DZn3vxbsPkoOdvdMzYQIh7hr0Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=g4iNwX7A; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=g4iNwX7A; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A398D2117A;
	Mon, 13 Jan 2025 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736797090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kz2f+1kr/L7lRDhd2aN0f6DjD9bpbko12N5sSmL2BI=;
	b=g4iNwX7ARjInul3M1m+dQ+3IfSXuHVB6qQC7o336zMq31C/6Bi84yue26rcoDAEsGZORct
	x+q/s7quWs18hQAlzhrKZesWjqbdE0HJ9KtjHBIXRUUff4D6SjWtBkx1+yIfGjMtmCfmGI
	hZ2XrgsS98ov0XKnujhWsOoAuPhv/18=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736797090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kz2f+1kr/L7lRDhd2aN0f6DjD9bpbko12N5sSmL2BI=;
	b=g4iNwX7ARjInul3M1m+dQ+3IfSXuHVB6qQC7o336zMq31C/6Bi84yue26rcoDAEsGZORct
	x+q/s7quWs18hQAlzhrKZesWjqbdE0HJ9KtjHBIXRUUff4D6SjWtBkx1+yIfGjMtmCfmGI
	hZ2XrgsS98ov0XKnujhWsOoAuPhv/18=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2676A13876;
	Mon, 13 Jan 2025 19:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rCKANqFrhWclHQAAD6G6ig
	(envelope-from <mpdesouza@suse.com>); Mon, 13 Jan 2025 19:38:09 +0000
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Marcos Paulo de Souza <mpdesouza@suse.de>,
	linux-kbuild@vger.kernel.org,
	mbenes@suse.cz
Subject: Re: # Toplevel Makefile doesn't process module build correctly on recursive make calls
Date: Mon, 13 Jan 2025 16:37:47 -0300
Message-ID: <20250113193756.721489-1-mpdesouza@suse.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 14 Oct 2023 17:35:55 +0900 Masahiro Yamada <masahiroy@kernel.org> wrote:

> On Tue, Oct 10, 2023 at 5:43 AM Marcos Paulo de Souza <mpdesouza@suse.de> wrote:
> >
> > Hi all,
> >
> > I found an issue while moving the livepatch kselftest modules to be built on the
> > fly, instead of building them on kernel building.
> >
> > If, for some reason, there is a recursive make invocation that starts from the
> > top level Makefile and in the leaf Makefile it tries to build a module (using M=
> > in the make invocation), it doesn't produce the module. This happens because the
> > toplevel Makefile checks for M= only once. This is controlled by the
> > sub_make_done variable, which is exported after checking the command line
> > options are passed to the top level Makefile. Once this variable is set it's
> > the M= setting is never checked again on the recursive call.
> >
> > This can be observed when cleaning the bpf kselftest dir. When calling
> >
> >         $ make TARGETS="bpf" SKIP_TARGETS="" kselftest-clean
> >
> > What happens:
> >
> >         1. It checks for some command line settings (like M=) was passed (it wasn't),
> >         set some definitions and exports sub_make_done.
> >
> >         2. Jump into tools/testing/selftests/bpf, and calls the clean target.
> >
> >         3. The clean target is overwritten to remove some files and then jump to
> >         bpf_testmod dir and call clean there
> >
> >         4. On bpf_testmod/Makefile, the clean target will execute
> >                 $(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) clean
> >
> >         5. The KDIR is to toplevel dir. The top Makefile will check that sub_make_done was
> >         already set, ignoring the M= setting.
> >
> >         6. As M= wasn't checked, KBUILD_EXTMOD isn't set, and the clean target applies
> >         to the kernel as a whole, making it clean all generated code/objects and
> >         everything.
> >
> > One way to avoid it is to call "unexport sub_make_done" on
> > tools/testing/selftests/bpf/bpf_testmod/Makefile before processing the all
> > target, forcing the toplevel Makefile to process the M=, producing the module
> > file correctly.
> >
> > If the M=dir points to /lib/modules/.../build, then it fails with "m2c: No such
> > file", which I already reported here[1]. At the time this problem was treated
> > like a problem with kselftest infrastructure.
> >
> > Important: The process works fine if the initial make invocation is targeted to a
> > different directory (using -C), since it doesn't goes through the toplevel
> > Makefile, and sub_make_done variable is not set.
> >
> > I attached a minimal reproducer, that can be used to better understand the
> > problem. The "make testmod" and "make testmod-clean" have the same effect that
> > can be seem with the bpf kselftests. There is a unexport call commented on
> > test-mods/Makefile, and once that is called the process works as expected.
> >
> > Is there a better way to fix this? Is this really a problem, or am I missing
> > something?
> 
> 
> Or, using KBUILD_EXTMOD will work too.

So it worked until 13b25489b6f8bd73ed65f07928f7c27a481f1820 ("kbuild: change working
directory to external module directory with M="). Right now, it shows the same
error as reported before:

m2c    -o /home/mpdesouza/git/linux/scripts/Makefile.build -e /home/mpdesouza/git/linux/scripts/Makefile.build /home/mpdesouza/git/linux/scripts/Makefile.build.mod
make[6]: m2c: No such file or directory

To reproduce, it's just execute the livepatch ksefltests:

$ make kselftest TARGETS=livepatch KDIR=<kernel source top dir>

Is there something that we can do in this case to solve this issue?

I'm quite surprised that no bots found this problem yet.

> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

/*
 * !REMOVE THIS COMMENT BLOCK BEFORE SENDING THIS MAIL!
 * below are signatures added by "hkml".
 * edit signatures below, or use "hkml signature".
 */

Sent using hkml (https://github.com/sjp38/hackermail)

