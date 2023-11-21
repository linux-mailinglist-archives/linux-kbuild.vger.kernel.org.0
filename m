Return-Path: <linux-kbuild+bounces-97-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9020C7F2E73
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 14:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B304B21092
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 13:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E147168CB;
	Tue, 21 Nov 2023 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="LgAU/sGG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="w6yFQvfT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D9CD50
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 05:37:44 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB41E1F8B8;
	Tue, 21 Nov 2023 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1700573863;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1LF9NlEYqjJGuXTMF0htcYDQN+3pat+mlgqYH5l6uo=;
	b=LgAU/sGGORVoom281P3FZKKq538aI1jI0nUpWZzoBsxZTWNvXC3w8aXkPo/9dMHrZH9YSN
	oyaM82M4a0DbJ/sEtnjpTDFipyUZHY06Ju0bty24fs2/q3YooPhptm2a1QyuiQIRP4lGkQ
	EYqtZjhSP8zx4X0aeeCDi6Q3jQjBXmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1700573863;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1LF9NlEYqjJGuXTMF0htcYDQN+3pat+mlgqYH5l6uo=;
	b=w6yFQvfTMzev+aVRvHYRdd28LcmcUwQobMoM0mCSW2iLXXuphuTCeKmIxmDccAhdjjcPW5
	CUmuYDly+B4E6zBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9757A139FD;
	Tue, 21 Nov 2023 13:37:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TabQIaayXGV2NgAAMHmgww
	(envelope-from <pvorel@suse.cz>); Tue, 21 Nov 2023 13:37:42 +0000
Date: Tue, 21 Nov 2023 14:37:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 1/2] kbuild: builddeb: Remove unused $dirs
Message-ID: <20231121133740.GA126856@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20231121115855.111358-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121115855.111358-1-pvorel@suse.cz>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 3.32
X-Spamd-Result: default: False [3.32 / 50.00];
	 ARC_NA(0.00)[];
	 HAS_REPLYTO(0.30)[pvorel@suse.cz];
	 REPLYTO_EQ_FROM(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 SUBJECT_HAS_CURRENCY(1.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.38)[77.18%]

Hi,

I could have added some description, e.g. "shell variable $dirs is not used any
more since 1fc9095846cc, therefore remove it".

Please let me know if I should resent it as v2.

Kind regards,
Petr

> Fixes: 1fc9095846cc ("kbuild: tar-pkg: use tar rules in scripts/Makefile.package")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  scripts/package/buildtar | 2 --
>  1 file changed, 2 deletions(-)

> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 65b4ea502962..8ac075dd0e9c 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -23,7 +23,6 @@ tmpdir=$1

>  rm -rf -- "${tmpdir}"
>  mkdir -p -- "${tmpdir}/boot"
> -dirs=boot



> @@ -42,7 +41,6 @@ fi

>  if grep -q '^CONFIG_MODULES=y' include/config/auto.conf; then
>  	make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
> -	dirs="$dirs lib"
>  fi

