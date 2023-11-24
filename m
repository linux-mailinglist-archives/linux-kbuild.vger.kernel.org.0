Return-Path: <linux-kbuild+bounces-159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645F7F78F0
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 17:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4A5AB20FD1
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 16:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E2533CE5;
	Fri, 24 Nov 2023 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E29219A8
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 08:29:04 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 192371FE4A;
	Fri, 24 Nov 2023 16:29:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 77399132E2;
	Fri, 24 Nov 2023 16:29:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id /xxkF0zPYGXeRQAAn2gu4w
	(envelope-from <pvorel@suse.cz>); Fri, 24 Nov 2023 16:29:00 +0000
Date: Fri, 24 Nov 2023 17:28:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 1/2] kbuild: builddeb: Remove unused $dirs
Message-ID: <20231124162858.GA177418@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20231121115855.111358-1-pvorel@suse.cz>
 <20231121133740.GA126856@pevik>
 <CAK7LNARo3FKQM1esdzk60TRPn1joVZ2SRVCcuUJ+r9DEPzLtfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARo3FKQM1esdzk60TRPn1joVZ2SRVCcuUJ+r9DEPzLtfw@mail.gmail.com>
X-Spamd-Bar: ++++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=none;
	spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither permitted nor denied by domain of pvorel@suse.cz) smtp.mailfrom=pvorel@suse.cz
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [16.19 / 50.00];
	 HAS_REPLYTO(0.30)[pvorel@suse.cz];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 REPLYTO_EQ_FROM(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 MID_RHS_NOT_FQDN(0.50)[];
	 SUBJECT_HAS_CURRENCY(1.00)[];
	 R_SPF_SOFTFAIL(4.60)[~all];
	 RCPT_COUNT_FIVE(0.00)[6];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 ARC_NA(0.00)[];
	 MX_GOOD(-0.01)[];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 DMARC_NA(1.20)[suse.cz];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[22.44%]
X-Spam-Score: 16.19
X-Rspamd-Queue-Id: 192371FE4A

Hi Masahiro,


> On Tue, Nov 21, 2023 at 10:37 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi,

> > I could have added some description, e.g. "shell variable $dirs is not used any
> > more since 1fc9095846cc, therefore remove it".

> > Please let me know if I should resent it as v2.

> > Kind regards,
> > Petr

> > > Fixes: 1fc9095846cc ("kbuild: tar-pkg: use tar rules in scripts/Makefile.package")
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>



> I filled the commit log and fixed the commit subject
> "kbuild: builddeb:" to "kbuild: buildtar:".

Thanks for fixing this!

Kind regards,
Petr


> Author: Petr Vorel <pvorel@suse.cz>
> Date:   Tue Nov 21 12:58:54 2023 +0100

>     kbuild: buildtar: Remove unused $dirs

>     The shell variable $dirs is not used any more since 1fc9095846cc
>     ("kbuild: tar-pkg: use tar rules in scripts/Makefile.package"),
>     therefore remove it".

>     Fixes: 1fc9095846cc ("kbuild: tar-pkg: use tar rules in
> scripts/Makefile.package")
>     Signed-off-by: Petr Vorel <pvorel@suse.cz>
>     Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



> Thanks.




> > > ---
> > >  scripts/package/buildtar | 2 --
> > >  1 file changed, 2 deletions(-)

> > > diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> > > index 65b4ea502962..8ac075dd0e9c 100755
> > > --- a/scripts/package/buildtar
> > > +++ b/scripts/package/buildtar
> > > @@ -23,7 +23,6 @@ tmpdir=$1

> > >  rm -rf -- "${tmpdir}"
> > >  mkdir -p -- "${tmpdir}/boot"
> > > -dirs=boot



> > > @@ -42,7 +41,6 @@ fi

> > >  if grep -q '^CONFIG_MODULES=y' include/config/auto.conf; then
> > >       make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
> > > -     dirs="$dirs lib"
> > >  fi

