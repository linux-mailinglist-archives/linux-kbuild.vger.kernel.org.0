Return-Path: <linux-kbuild+bounces-13118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKsaD8oOAmplngEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13118-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 19:15:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B65513353
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 19:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C71630226CB
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 16:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D02843E484;
	Mon, 11 May 2026 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZL6FK5y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF842847C
	for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517316; cv=pass; b=hGWop5waI/K98debTeU/4GIcK9fco4uJXmTBA5qX49TIvhEaggVTh58U55UtNdBxKRk2oKKwf6y0I00/dRr1o/2wLafE7SWhcoGgZ0HIkmeuA/mLXLcfqFyAfnOFrRxLGcYOmF01Zh/OdYj9MpvO9SeceNkqwzZyPGEz3y5CZbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517316; c=relaxed/simple;
	bh=4S7C02MIUqtzmropOUva8L19yYp6EZ1lPURTmBTWjnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuXdItVe9XT7RXFC+wr+bXl0SzScmGTvV5x2RDwFSdt1h1zCZ/6k5N2aZoCZe+vEFWGrJmIp2jpQOPasvmU14JWXvn9eOVCLbd5ghhnAHuhJTf3II1fACWMje/adaTIiW/kFqLgAworYGa/AdmOa+HFEWxWDdC6/VoIQWNdfebs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZL6FK5y; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c8f9846c8so6388910c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 09:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778517314; cv=none;
        d=google.com; s=arc-20240605;
        b=jV+NZqTAlcl1Z76axXbDSkbafPWyCu70BIY79b6ai/+yR6mQJY106MgTDnQpuP4ohN
         Fb/a0GGmUVyiGG+wxpUSy3QDomblsgwdEz/ziwQICW8yOYaIzhDNGtO6P4W8bRGHiDAt
         W03E8ZUbVp33AZ19YGoge1tarjL14vqP3j8tKu/RD72XcJJPeBNca1fxM6NtZMBmPbay
         btEbek4g/fBG2TXSNExsAAxsqiGgOHCEJ7Wi5UIiZrpTSBoJsSsWHKNy2Wmx9yABpaaj
         SAzYGPeZgLjrPq8hDj76LWxYC0kwRtp7TOG4cZ02sgQRnNWSBnCTqrxJ1VOGJfryllJh
         WGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        fh=grSaPN/iPeR4FXBJPL1hZS2HHGcwUmJLJgnMjT9qN3c=;
        b=TJ53FAXxjOH6cxB0J+p9DVnLR4PKy7sgsLmpa4xtf4yBswl2Q7EZFUeaw97d+a8ADg
         DB2sah35hCipsv4ubh1jxjdmgr68L4ZNesAt3mMUr0NJaBM94bj93dQSkZMvEE2mxHOL
         yyJjwVp84Ic8GNb/csR1jP0jCjRmEMRzSAXRiiWr8kzuVxOy2PWGz/mqWNsm2IzpOFOP
         gaTBNeQhoFMWarmCMA5V57ldYjQ3EFIZZciFLuhEISiA1hyUCfW9rvQd16agXpkJjZAQ
         YErCKZ+2evyeRiO03nvZJBjXvbpz3J3URRJzUts3N6LaouwfrYw3s+MrXhrPbmOtn8Kc
         nZKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778517314; x=1779122114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        b=qZL6FK5yiHGU1UYpFox73RIlI3Bp+cacpR16tSKhsLmdbEUwqTWF7PkSPDxv9OwoXw
         /UEi0zPK06a1LzR9ZZ23m9YOZ16GidMugm7oobi2d1+EHh85B+fY1RjRKsM45paKtC5A
         A0T5usgqM4rS59r5k+ecCruSenojaTYEB+TqcS+tuMGFQ6F045Lb93YOeJLRFcUaZHa1
         wFEL0ijZ2/+3oP8sE7HixjnJnUXr4tojrllQXnb121sfLEIGfbocVhKNpYULSqPJweJS
         HHQYNl+HkiAVO2dmBQHsLzJ7zPP4hRHptHYGuke86yPe5KMVcK4n+QlBsEmDzuSBLcW0
         ZBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778517314; x=1779122114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        b=cgf0iQIlnWxDs+TBsqbTzGD2uyj6TA54iD/8zopGF5iZIjhWsjsAfC2Z7E691DPgLE
         NnI4Xh8dDOivdczPJRozwOrTB99tF5F99/Rjy+084l3ymG/5v91UP64ewa/1NTQukZTC
         ZeVT6HtPg5/76++TLxfoEB1uVvsrezMcwoOPEl1++8xT4xpXnll/Xz7QkjiQ7oLi/R1j
         7T155C7qmxihs+7xlTh5UedY44fgEsaOfMCkwpQCltEGuEKz1lIWJiywghqOKdIIqCGQ
         1FOR6ux2meFBYxmLr4sKE2io3lea7AtaBLd/Vxxn20WDQbFsYFTkjAv2aXMF/Gy5OfYL
         msjg==
X-Forwarded-Encrypted: i=1; AFNElJ+gJlC2oeft4hTCqP9+SXKbkP3jOLaINcX9F/Np6+ijx/yYFfciHDYQOGg1nkhkGWolQPT52Lqh2vjO4PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPesWkNvjGedyg3UyahoqV1kOcf3gtJzQsUwOIrKPuLe6NmzKz
	y+QObCwLInCmX5IxGlmjejqcyDMrIJuVS4WUc2nKtYO6ycoTcoCw86k7PtTfH6mhBazfDqRKzp7
	13cXwl93V1xBqO0OFuGPMoR6D1g6jAoI0KPR685QY
X-Gm-Gg: Acq92OHSdZm6G5FDNBPikCH7EHpHoKMCT+jIdjxij8kdb4j2/Kce166d1fsApmdOcqF
	LDzOJKZlyG1Iugzst1bf04BnwqkWQr78YlqOcKc2lArNJmI3m6PPMUhTOePjJHp21I2QVu1npTJ
	NjBsI6sIZ96dSISHOZbwFjyrwbuIZkOyKiexMUbbtktlZtrISf3SILpsQvLEI/j5uea/Dlsanao
	md9NfDZm1cO4NDTtg7EbJ9bqbOIOb7WbISfzl0dwpJIklQdHOYthgO+ZOPR4h0OiCD8GBCjiSkz
	zT769C2W4ykANoRnpqWfqsmHW/v5lATV+a3vxgESGP7xZkbVOPG1NQ5k4wt2
X-Received: by 2002:a05:7022:699d:b0:133:39a6:2b8b with SMTP id
 a92af1059eb24-13339a62ddamr337498c88.44.1778517313279; Mon, 11 May 2026
 09:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org> <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
 <afi0nQ84k1oz5RyH@elver.google.com> <871pfiw343.fsf@trenco.lwn.net>
In-Reply-To: <871pfiw343.fsf@trenco.lwn.net>
From: Marco Elver <elver@google.com>
Date: Mon, 11 May 2026 18:34:36 +0200
X-Gm-Features: AVHnY4JXza1HWD1Ghv5ACGmGvnp1cOeRA6XD-S98uX5BfJA-pjXWKAfvxk-IzaE
Message-ID: <CANpmjNML=pbnv7QLf8Qi4wY2nDCk6oOw2T_Vs-MfMwWh=0m5Ag@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 60B65513353
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13118-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,lwn.net:email]
X-Rspamd-Action: no action

On Mon, 11 May 2026 at 14:19, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Marco Elver <elver@google.com> writes:
>
> > How about the below, i.e. adding type decls that only the kernel-doc
> > parser sees? One complication is also DECL_KMALLOC_PARAMS, and adding
> > kernel-doc parser hacks for that looks pretty awful, so this is a lot
> > cleaner.
>
> I'm going to be a while catching up with things, so this is just a first
> take.  I strongly suspect that the people who object so strongly to
> documentation markup in general would be less than fully thrilled by the
> addition of this kind of workaround.  I'd like to ponder a bit and see
> if I can some up with something better...but again, it won't happen
> right away.

Thanks, Jon.

The technical debt (hacks) that would accumulate in the kernel-doc
parser just for accommodating slab.h might be quite high; slab.h is
rather special, so the "#if 0" solution might be justified. Then
again, if there's a reasonable kernel-doc parser solution, that also
helps in other places, I won't object.

I tested the "#if 0" version and it works as expected. So to move
forward, we could consider it in the short term, and in the longer
term, see what new powers the kernel-doc parser can provide.

