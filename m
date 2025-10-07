Return-Path: <linux-kbuild+bounces-9023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8792BBFEC8
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 03:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76B864EFEFF
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 01:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4574B1F0E58;
	Tue,  7 Oct 2025 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OKadV1Rz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ccEZXhc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l3O591YD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KGeikOmQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5A418C011
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 01:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799861; cv=none; b=k8w/R4G6R9pryUXXpAvZlMi9sKK99+HPIdgRSDLr3b8nEvPTf2CJxsoyBemviRA3hAe5jnzlyEC9nr/ureiSK3Ti4W7ir08Fg5wwtb9iqvgHq8PmyyC5nk4Ql21/ApkGsPFHSrcXWLrV+zXqWZGzRoGzuKK6ePk9BkGLndY5d60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799861; c=relaxed/simple;
	bh=OvSe3sT9R5NXhiQy4ZqwKuPlshnhEUGx+x0o+GY0cqg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mhk4dhX60Yz3ouZFdurNedhyKGHUMww4SxbjqhZTf0aPXchhgmIyU9ko7l1SCoRd4ydsWe/NzpQhmCgNdbVWGrK3DOF5ts7M9Dte+dljfg/3Ha7ovYoznMqxHy8jOCnlzD59l0NU1yiwka6kf/zQoKmtqyAXFk/u1oWbLUXMEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OKadV1Rz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ccEZXhc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l3O591YD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KGeikOmQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D49B63369B;
	Tue,  7 Oct 2025 01:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759799851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5vcFiWJUr9hzuPL9RMNSONf1mEYtCaF3D1fRVUljQw=;
	b=OKadV1RzszIDl5tkRvcodF4r7+EB7nClPjsbgqBnLuFbdr02S3lAnluqhD+maXF21aZQLA
	GBrpheaTlkTW9Aq6cYLTZ95YjU3JMGFXwcHS/XG4oR+FyQGSxBWc+LZ+pvOmdFjWWzyJU/
	wieaIbXrA9YnUFM7cmB48YWNyQLMN1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759799851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5vcFiWJUr9hzuPL9RMNSONf1mEYtCaF3D1fRVUljQw=;
	b=7ccEZXhcl8oT4/VOEQmPJll5fgI1h1njKk0A4KNnOlnRCjAWYFkujek8pUxPLVsfM8/VsN
	ohymQgASYHQzfTCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l3O591YD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KGeikOmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759799850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5vcFiWJUr9hzuPL9RMNSONf1mEYtCaF3D1fRVUljQw=;
	b=l3O591YDQBLJ5+UIwg7ZS1inGjHocaXry3Q6fk85xU+JDA1ddr9m+4wLyd3jk9awiEfbsm
	i88FTManR1dDBGfyBdNIP/KYrOaGOyOVYMXeKmzA9XXHQKHubp4faoCsK5HertJXoM4KsF
	VlpJPq6OBTWAiNpBvNdsBkaXsKFklkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759799850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5vcFiWJUr9hzuPL9RMNSONf1mEYtCaF3D1fRVUljQw=;
	b=KGeikOmQm6FCP7OCeB/adZ6p2mL1kaVq/gxxoThatxx8QoLil+tociWbMjC9MXaXQYhFjg
	TZo4JU5Nts0To/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BD2113693;
	Tue,  7 Oct 2025 01:17:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YbnsOCdq5GiYSQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 07 Oct 2025 01:17:27 +0000
Date: Tue, 7 Oct 2025 12:17:19 +1100
From: David Disseldorp <ddiss@suse.de>
To: Dmitry Safonov via B4 Relay <devnull+dima.arista.com@kernel.org>
Cc: dima@arista.com, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Message-ID: <20251007121719.45090b21.ddiss@suse.de>
In-Reply-To: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D49B63369B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,arista.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dima.arista.com];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -2.01

Thanks for reporting this regression, Dmitry...

On Tue, 07 Oct 2025 00:55:03 +0100, Dmitry Safonov via B4 Relay wrote:

> From: Dmitry Safonov <dima@arista.com>
> 
> Here at Arista gen_init_cpio is used in testing in order to create
> an initramfs for specific tests. Most notably, there is a test that does
> essentially a fork-bomb in kdump/panic kernel, replacing build-time
> generated init script: instead of doing makedumpfile, it does call
> shell tests.
> 
> In comparison to usr/Makefile, which creates an intermediate .cpio file,
> the Makefile that generates initrd for tests is a one-liner:
> > file lib/kdump ${src_dir}/oom-crashkernel 0644 0 0 | usr/gen_init_cpio /dev/stdin | xz -z -c -e -Ccrc32 > ${target_dir}/oom-crashkernel.initrd  
> 
> As fsync() on a pipe fd returns -EINVAL, that stopped working.
> Check that outfd is a regular file descriptor before calling fsync().
> 
> Sending this as RFC as these are local tests, rather than upstream ones,
> unfortunately. Yet, the fix is trivial and increases correctness of
> gen_init_cpio (and maybe saves some time for another person debugging
> it). A workaround to use temporary cpio file is also trivial, so not
> insisting on merging.

The code change looks fine, but the commit message is a bit verbose IMO.
Please drop the first and last paragraphs. The reproducer could also be
simplified to e.g.
echo | usr/gen_init_cpio /dev/stdin > /dev/null

With that:
Reviewed-by: David Disseldorp <ddiss@suse.de>

> Fixes: ae18b94099b0 ("gen_init_cpio: support -o <output_file> parameter")
> Cc: David Disseldorp <ddiss@suse.de>
> Cc: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  usr/gen_init_cpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> index 75e9561ba31392e12536e76a918245a8ea07f9b8..845e2d92f0e56b02ba5fc12ecd243ce99c53f552 100644
> --- a/usr/gen_init_cpio.c
> +++ b/usr/gen_init_cpio.c
> @@ -6,6 +6,7 @@
>  #include <stdbool.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> +#include <sys/socket.h>
>  #include <string.h>
>  #include <unistd.h>
>  #include <time.h>
> @@ -112,6 +113,9 @@ static int cpio_trailer(void)
>  	    push_pad(padlen(offset, 512)) < 0)
>  		return -1;
>  
> +	if (!isfdtype(outfd, S_IFREG))
> +		return 0;
> +
>  	return fsync(outfd);
>  }

Another option would be to catch the EINVAL error, e.g.

--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -112,7 +112,10 @@ static int cpio_trailer(void)
            push_pad(padlen(offset, 512)) < 0)
                return -1;
 
-       return fsync(outfd);
+       if (fsync(outfd) < 0 && errno != EINVAL)
+               return -1;
+
+       return 0;
 }

It may be a little portable than isfdtype(), but I don't feel strongly
either way.

Thanks, David

