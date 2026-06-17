Return-Path: <linux-kbuild+bounces-13807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +glIE7IUM2r29AUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13807-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:42:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6069C8BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:42:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=f4vgcUEe;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13807-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13807-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 940D4301D31E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC793B0ADF;
	Wed, 17 Jun 2026 21:42:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A90039936D
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 21:42:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732526; cv=pass; b=WSZpFBue0nnAxf6sIz4fV4nRsZ2w4qrfE/78CTR/CdkBWuT95apgcUs8EgbCHzL9GrHaLm6gZ6hSZErlNVT7OiNf274ZM6Jgcfn/eQu6pJtIoIuzgYpu2igm4OoMSM6uckYuYYFOiWFBrX5/CMMBMtVjZ1GMOBM5PXT8zYcZalQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732526; c=relaxed/simple;
	bh=Nva8p6KvPQaO0ANvk1Pn9Tn49nI/UIEJKZtTtEn3enI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VphwYpWp9dhfh8U2IbuttsF+Lmg0UXp0tEOM/+YN52X7iJ/+Wq3JDR4euAoeflZmbunNuy+3ZG9a/uGZmdZ+3n9Jq2/fQK0/Sz8nWE46ngdqEXd0weCB4oMR6qFd0vPQoEb8oD0Y1ydb9PqoLEx7eq9K8WHYV+3R/ydxuKFQ0Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f4vgcUEe; arc=pass smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-695a3842230so4538a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 14:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781732523; cv=none;
        d=google.com; s=arc-20260327;
        b=p1QEEsMq1dVB0QVkltfiiSGPS+l2VcA/xwCopQlefxeq00FR8BZUR65RfcIJoGbcBM
         FB99rdga6m8oqcYrsMRKKAuUwUPUlb4iy3ttAuu5sRUfd8VCMbYNT5DL8lC9CxD0wm0b
         wWCMwd7zeZPzCV74A7bbwFdU5/z27azKBKVy0VXkdmwaFPQNfrKFMcebxEDDtnk+keYH
         m00r1n227WZY/IQjKFKNK5pPKPBMFumdqBuMM1YqOm7NaqHZVcHo1AXYoMPqw9358JQ4
         2dBR8SMNL+uqc/83HzcTDgoGMS0PhctvHb+OX9k/+Ay8H442NixNisbqEy55r678h4v2
         Z4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5Lv7prv5t7a2BiUhE/2Cub96h5n8YWnG/poPJebrKM=;
        fh=8wED2D+XiZKmjuf4KG63awSs+JsDIfNDi9OC52LCKm8=;
        b=oPNsMCyUyV5KEh8tGtNqLu0ttHeiGt0e/5wiE/pFXGincWHtfj91yRab0cPsja4RXG
         AbODCClTYBFB1hUzktxacxdS8nIYXr02USjQJi/OSIrKQ/F7n2vOe9VOXkebpN8WJDBe
         SGa3pvYfp24sMpox2O6CDREnIuKYLxRh0l/p7GHyPo9UyJ2YaPXv8iuYtInEbbKborzi
         +VhWgBpqCI6cP6zagDOcxvRrnub8LGdnYo/+L5c2UCtLk+CiAkYxggmOy3Jn1m3by1tm
         CGif3y43W/mFyOGW1GTIuKIZ0jOYhyIiw34d0xWKL6JX1KuXz6soujQHCO77PTBPz9FI
         +ghA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781732523; x=1782337323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5Lv7prv5t7a2BiUhE/2Cub96h5n8YWnG/poPJebrKM=;
        b=f4vgcUEe3D+yoiQg5Wpr3urmX6V3F9JP/Qs4LhPnnYj77yiENCHPrXZZ8YgAuihzc8
         Gjf1Ah76QH1sHLK2B8nN8oAHmDVJIA+4eYDQHGdlHgiE85mtSciD2dLMk3mX/YTb6gtb
         MRmPm7jQnd0iL/o70oi15a+iLvEqrL8tBs3v3Fgg9lILqL1GljDG4wyldInbejfNmo71
         Yqhkqq9Ixsf3dw+86DYdT5fb3bHF6dnCHFWnbHiQmWWyL4w7sm1PAJYnE3nohmgDI/e2
         uyaSMrr0be1agN42OkauBPWx5G7f5AvEjSXM/ZuG4BZuUOQx6nNg4TZP2WyFhNlvUEhO
         7sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732523; x=1782337323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5Lv7prv5t7a2BiUhE/2Cub96h5n8YWnG/poPJebrKM=;
        b=sX7VVgFXk11kvXtsHUiWqZY1YVOssKqrODvk8Wk4/hVS4pRFplTFGzQ1DYKiIKgMhI
         YTydMDZ/4OfKTzeockycF6wZqntzke39mrgHOuZZCN2IyJvorPaT7sKvRrO+caDr5d+S
         Y99S2rQEqHZOmxFHzwKAjl2uqebIKRYp3aYTq4jISaLG8VvBo0NccKyjjh/+qsF9Hdjt
         +rP/p6O/JFH6zS7Y2JEhGwOsPUQGvrNcvm7QRYTKQrcTc8ghECDit6vlW4Elrm6RHxLI
         eACv78sSrQrWsjwPfxoirTLAYlgr9o+oznf2IK78bBMXzk+7MCHH89nr57S8+4KfCYGd
         d5cw==
X-Forwarded-Encrypted: i=1; AFNElJ8SnBreInNgybvkt1n6FVO0NU1HCOrPIdfhKN9QoY/mJ29zuPkm0bcjwdHDlRANhWIrfzsFH98Swk4hcyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQ1hso+fnjP8VwjCtOXJGlFZNnajVWFZak5oElz8DL+HsMn/u
	QLFci1y2zu/+0BCvhQJ3hWjtI5sfyToLe8DVse2xXSC5UXTZ7T5vzfsCdin/jbHkkYJ9OSBkwPa
	eyV2FkLtA7INBOMFefVHLm7oUUpTVMY9s864I8TM8
X-Gm-Gg: AfdE7cmcBbqr3wVbPz9PxUGyJjZQJwYUBAcqs7vh4QfIzCBOy2Gi9n4GA3CTU7ifTB/
	WME/PwtLf4YihNa6O5UVst2MKb4dqJsN5chgjshdVXczy+48IS0jwi/z03hqxjUB1w7mP6W0aGv
	eyUkajnIu1PZ08CuTDJGbehfVNjhOg4TWwLXR5Kmftmam2LQpDQBk+vWrIZ8+BqJbF0qxlWHm6/
	Fm1C60oXxy0ddzUCwPPrqkvUhHrZMjPXuB+hFZt8wBIbiA9zbpsVQeuExjDzUZjxtuGXjpv+ECG
	foMQGDSy8bK9Kv102HyLsi+E
X-Received: by 2002:aa7:d8c5:0:b0:68f:d45f:e494 with SMTP id
 4fb4d7f45d1cf-695d0b4463emr3912a12.11.1781732523187; Wed, 17 Jun 2026
 14:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615222019.4116687-1-xur@google.com> <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
 <71a166bc-06c9-4a84-b61b-6b0d7c6c6585@suse.com> <20260617210410.GA3894029@ax162>
In-Reply-To: <20260617210410.GA3894029@ax162>
From: Rong Xu <xur@google.com>
Date: Wed, 17 Jun 2026 14:41:51 -0700
X-Gm-Features: AVVi8CdB7vBXndZXz_KrvDQi741rj-IVQ_RGwnZUEZdK5IFAcKX3ThnZG79UTm8
Message-ID: <CAF1bQ=SEXqObcmmZb4G2g+1pU=WfStho+_n8Mb6KiVWBR5ni7w@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
To: Nathan Chancellor <nathan@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13807-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:petr.pavlu@suse.com,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:samitolvanen@google.com,m:sidnayyar@google.com,m:jpoimboe@kernel.org,m:edumazet@google.com,m:rene@exactco.de,m:legion@kernel.org,m:johan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,gmail.com,google.com,exactco.de,vger.kernel.org,lists.linux.dev,intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AB6069C8BB

Petr and Nathan, thanks for the review and suggestions.

I will send v2 shortly to implement the more targeted approach.

Best regards,

Rong

On Wed, Jun 17, 2026 at 2:04=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Jun 17, 2026 at 12:48:10PM +0200, Petr Pavlu wrote:
> > On 6/16/26 12:43 AM, Rong Xu wrote:
> > > A more direct fix for the warnings in
> > > https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel=
.com/
> > > looks like the following. But I believe the solution provided in the
> > > patch is more comprehensive.
> > >
> > > -Rong
> > >
> > > =3D=3D=3D=3D=3D=3D
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index abbcd3fc1394..1f0a379b43c8 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
> > > const char *fromsym,
> > >         /* symbols in data sections that may refer to any init/exit s=
ections */
> > >         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> > >             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTION=
S)) &&
> > > -           match(fromsym, PATTERNS("*_ops", "*_console")))
> > > +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_conso=
le")))
> > >                 return 0;
> > >
> > >         /* Check for pattern 3 */
> > >
> >
> > This variant makes more sense to me. The initially proposed patch
> > modifies the match() function, which is a generic function to check
> > whether a string matches any of the input patterns. The modpost utility
> > uses it to match both symbol and section names. Adding symbol-specific
> > knowledge to this function seems odd.
>
> Yeah, I had the feeling that it was a bit of a layering violation as
> well. I think I would prefer this targeted fix for now since I will take
> it as a fix for 7.2 in my planned second Kbuild pull request. We can
> revisit the more comprehensive fix if it is needed in the future (while
> seeing if we can address it outside of match() regardless).
>
> > I noticed that LLVM has recently made improvements to reduce the number
> > of these ThinLTO renames [1], which might be worth checking out.
> >
> > [1] https://github.com/llvm/llvm-project/commit/975dba28633d2f3746a8a37=
0741b17024b0f5f9b
>
> Indeed, we have started using that for regular ThinLTO when it is
> available as of commit dc3b90751d6f ("kbuild: Reduce the number of
> compiler-generated suffixes for clang thin-lto build"). Distributed
> ThinLTO support will follow when LLVM 23.1.0 is released.
>
> --
> Cheers,
> Nathan

