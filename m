Return-Path: <linux-kbuild+bounces-13980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ME+jJJ/PT2qoogIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13980-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 18:43:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E587338FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 18:43:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ISVQxSFq;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13980-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13980-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A89F930013B7
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2026 16:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83BA395AF0;
	Thu,  9 Jul 2026 16:43:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76B387362
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Jul 2026 16:43:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783615385; cv=pass; b=C+OiPUR00BacLnuiuySmpTT2Sc3P+noS4BdlYyyN2IPl1tSA1KWTdpDe1ZV9hX5/Lc2CGaiP40NGGBwOC21kvvAVTrgFAS9Bjfp29KHRj9Hr3t0IZkLyP0kdVymp994jzzB+AqgWJffYumXdsqh4U0Z6eRocQd7qlzG2NGpd+AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783615385; c=relaxed/simple;
	bh=Jzk1zwXKjgQrq2kn6Jx4GC7Njva0hrCgXDrsK6EltA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=isV38hDdFHxRWyEYKLaz17EZ6u6+lNtWpFlJ8EO1I/Jz9SDB3qHb/qWgBTwJ8gUHLcLHq6ksgZwp4ILTnvN3Ha2aSj7MOZjcOkYP6Qqc6abNn1SZ+jfMqDpZ7RUgojRS26vy/o2RHc+jaYJqJKlmks3yRSiQqjPUi7HIqhGWESQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISVQxSFq; arc=pass smtp.client-ip=209.85.167.170
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-494423343f5so142416b6e.3
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jul 2026 09:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783615383; cv=none;
        d=google.com; s=arc-20260327;
        b=nQmT311nl3mDWcrlZ6ScPG7aOi2qb6aycQiy2FZ4KXpz5/8IOwZYpxqnhX6q0py9aB
         1SbPXWZuvRaGcgmuUu5Sb7vR/q7xbbbq8jQIw4o+KZLGR94lFtHv38KLhEkKaDS2s0P/
         g01xSxY1BQHGZI8W8Xq3RITdWo38frY6lupAgjwIT7JUU7hrRvcOI6/7eta2bJ0gulkt
         ts2LtYGyLoMqo1Q4TErcbxSCfi9trbj1BOtsWw68q5T00b2cO/vN/NYZRiVRIdlVfk41
         cTfmxsWHDFPLxPQKmSL8Sd0XLsoJbnLsynEgQhsf/qCq049BYstNTfiVisbx6uUwtqZD
         sQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJ6nQqUSW8jEheJRpMqjzt0i7UvnB+d8I9sK+7bpqCk=;
        fh=XPWDVC5GpeKp/jfIBpswAWQcHydzYqS79tsqyLB2R3I=;
        b=p51qqmyazLQwqsV83Z5Z9zu9w9Wj8kFiiaVnDHIk6AzMZn9W35qBNYJ1ER3pUoxFRU
         l9mcA76Y0zXxdw2VdIe/zw2Ec88PkwaMpcqYrz7ta17KONVuKd6j24RsPnm9Qe2X4tnB
         ORD1o+AUzmhnNMJzfgbeRhgU4n6NAUf6ZIcHQP/9tlPDk0ZLYdjfbU54PRVuLdq+ZZt8
         0HSBcSub07bponTCaxxJ4X5bbkWprnk3AxpEKCRD1S/1TftixYjTmlwDl4qdHMY0Bn/u
         eB7+9HbizkgLFd+kgSYrz0w7MaAv+YLEvnYlHoMaRjQm7xxZ2m83FgjiFta2GPwKLnT3
         EmhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783615383; x=1784220183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJ6nQqUSW8jEheJRpMqjzt0i7UvnB+d8I9sK+7bpqCk=;
        b=ISVQxSFqhlJMrGkvuz209GbiBZ3/bc/Y+FeuFSYu/5qSn2TnsGbzl1bwBhPA8Tvdl0
         K6FYZbUQkwtQoTCs8BnS+SKDtZTb8aAViasJmMQoSbGTPSqM3p2MK7vHeuaFeZ01LEZv
         gNZD7YwbSB4Zs+Ctsu/KXCjx5U3HClKBAnM7RWOizdHCJxSPHWqi9cXcdgXUUo/4x3tw
         TxT6Ffs5wAdts3S9BskwCK+DU7NHEAie4k8eUe6hAmi4w5Xd4Ue+ZlFqRAEvxaxJ40sc
         NGeu2VrsP/lhfbuvy1xL21DJz80T+1k//bVl+lF1IayquhUVUYvT0Nf0evbGY3H+yYyF
         ig9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783615383; x=1784220183;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJ6nQqUSW8jEheJRpMqjzt0i7UvnB+d8I9sK+7bpqCk=;
        b=S9hFROK6ej3MBqqMGvihPXpT5nYVSIj1j/MuHIfYuJZTUA1DAghcqEHSXLbo8Sse/U
         +cYwTbNZmig2SkzIcKYsCHWTLNVcxgYleyleXvY3vCdhxssMFQxuPpaQSOQRUgr9puHs
         BgKxqoaDfAuaQ6s105CEHBsO9aTD8g+DO21ZJ3XG9LAtpVQaYKQdzSWkcYIpWpV1NTdo
         h1uXbSgc4416CkdZ1HOvq40n+NwYphPlS7hmOfpliaxhnr9b0hFeA9gKlcDPJ0yxvabO
         M+JYvYUkIEl8x2prui0EtDiJx3MMTtAta8OFhPrD+t02liyosOdMf3CAcu55B8FB4hn2
         t4zA==
X-Forwarded-Encrypted: i=1; AFNElJ95Rc+bqVIMkRW4+b2Z4fgFwXU6TgH25FSdzenbb38ynhUVs1DPUdyE/TrugQzHp+gI9XTxx1qPsO0CZsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyK0gV7RdEA6BvXXcEYExfqZIigVU+0tmU5dMWlTy9pykbAOOT
	bA9QnVsqZPq6jteIVqmuvEUvIqV0Rjq+wHeg2ILrOYbK1CvZc2H700/iG0cYEZfItCB1cgc3VKr
	KGyGbWr5AZ2GVzREAux8WIzy7oNzfyks=
X-Gm-Gg: AfdE7cmIaeJOSTO4n+GLnoUynec4rXlc87udMI8rWmDARpXEB3MiWioti6UB28CEdEc
	FWM0eg8wTbP78YucNp2hqxlh9F+m/zUaXaf7sK4cNeGEHyzJ2exQw0+lnuxFnh1xCmRMRYU5+0U
	3u5j+PzDidHj3Uqhd4jLVpsuH8Io8FCqYaBPnWxjSu9xxphYrsuNA3vrNMUv7kfUNvE7haqIMFF
	PO5ToPy6BJnSOBnPnJTY8qBOd3hBv1vE1jLz4lpbV8jjPzj5K7kA/a2V+MEiDBbTPrZhx3H4dZ/
	F9Bob59zk2zH
X-Received: by 2002:a05:6808:221a:b0:4a4:82b:2a35 with SMTP id
 5614622812f47-4a4082b2c4cmr680852b6e.1.1783615383240; Thu, 09 Jul 2026
 09:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com> <ak6bPbhLtfBV5M0q@levanger>
In-Reply-To: <ak6bPbhLtfBV5M0q@levanger>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 9 Jul 2026 17:42:51 +0100
X-Gm-Features: AUfX_mzuQrZBv7sc-iCQHfpMq2K_coulFaG-IOerhDnAvV3DYKBBTXbMF2eS-Lg
Message-ID: <CAGSyskUr+_8gBij1Kw2SSNTP+pHBkndyJO61tetTf8+6i=mS4A@mail.gmail.com>
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: keep temp file in the
 output dir
To: Gustavo Luiz Duarte <gustavold@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,debian.org,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gustavold@gmail.com,m:nathan@kernel.org,m:leitao@debian.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gustavold@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13980-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gustavold@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88E587338FE

On Wed, Jul 8, 2026 at 7:48=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> On Wed, Jul 08, 2026 at 04:04:54AM -0700, Gustavo Luiz Duarte wrote:
> > merge_config.sh currently creates a temporary file in the current
> > directory. Create it under $OUTPUT instead, which allows running the
> > script against a read-only source tree.
> >
> > The default behavior is unchanged: $OUTPUT is "." so the file stays in
> > the cwd.
>
> Out of curiosity: in which situation do you need this fix?

Our build runs in a container that mounts the source tree read-only and out=
puts
the build artifacts into a separate rw mount point. We have our own (cruder=
)
flavor of merge_config.sh and I want to use the upstream script instead.

>
> >
> > Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> > ---
> >  scripts/kconfig/merge_config.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_co=
nfig.sh
> > index f08e0863b7128..a63250d4cbf12 100755
> > --- a/scripts/kconfig/merge_config.sh
> > +++ b/scripts/kconfig/merge_config.sh
> > @@ -122,7 +122,7 @@ fi
> >
> >  MERGE_LIST=3D$*
> >
> > -TMP_FILE=3D$(mktemp ./.tmp.config.XXXXXXXXXX)
> > +TMP_FILE=3D$(mktemp "$OUTPUT/.tmp.config.XXXXXXXXXX")
>
> <bike-shedding>
> While this does as written in the commit message, I'd rather expected
> something like
>
>  mktemp --tmpdir=3D"$OUTPUT" .tmp.config.XXXXXXXXXX
>
> instead.
> </bike-shedding>

I can send a v2 with --tmpdir=3D

>
>
> When I am reading the help text for merge_config.sh's '-O', I think we
> should adjust the default output directory as well:
>
>   -O    dir to put generated output files.  Consider setting $KCONFIG_CON=
FIG instead.
>
> With a read-only source tree in mind, KCONFIG_CONFIG probably has to be
> set, otherwise we'd not need to put the temporary file somewhere else.
> Might it be more consistent to use $(dirname ${KBUILD_KCONFIG}) as
> default for OUTPUT instead of '.'?

Maybe, but then, as far as I understand it, setting a custom KBUILD_KCONFIG
would lead to object files (like the conf binary and other object files) be=
ing
put into $(dirname ${KBUILD_KCONFIG}). Is that the intention?

>
> So, once again: in which situation do you need the fix?  Is it really
> sufficient as it is?

$KCONFIG_CONFIG is already derived from $OUTPUT, so the current patch is
sufficient for our read-only source tree use-case.

Thanks for the review!

Kind regards,
Gustavo

