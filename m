Return-Path: <linux-kbuild+bounces-12787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GrcCB8f32kjPAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12787-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 07:16:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3B4006B2
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 07:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA5B8302593F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 05:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDE07E0E4;
	Wed, 15 Apr 2026 05:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG54uMr0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A135B633
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Apr 2026 05:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776230101; cv=pass; b=jeJHV6iI8O4+Fo/Pq4sixHx2ObUcTKMnxZ8vZ8TwQrTl8NySwOlzPXU1jhZqWt0PeF8HSTkoB1wU6WEoV086VIpgsWpQqdc94HBLTTpGeU4I9+KEHC7g3WVKSEInj2nEPfp3z8kflUz0HlhtBiwcEWBMgIFp7l7oB17XBZABU1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776230101; c=relaxed/simple;
	bh=EEsEjaszIy6U1t2M0AT9FWo5sHsTueLI/JTM8CIT+Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5Jq1tdhq9FMTsvWjr0P3LRqf/MvFkf/AdPRGYR4mmjzHzmybMgoZMcC6or06WKGiNxUflIuFEYFpDNv8HmzjbPU4A1C2ckaVSuh92ckeK2KHxQPIWcPVQIZszSWDGef10Spo/rBGPxhLy3YpsME25RmZq/PEvJCdfMBqWk+7bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG54uMr0; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so3759871f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 22:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776230098; cv=none;
        d=google.com; s=arc-20240605;
        b=GZJo6tQSFFFBAIZjWCv7jltP85piPU/RU5RZGKMCwUM2/npkjZw7J4+mb+AtpWZn7j
         Scp4lAWk8OvU3DIGBdIWJ7zOz1jU8U9USXp5pdXjUEGFhQYiSHWLcIcFoQFoYQ+a3ywv
         nUE3+RUFnctEsdx6UO0I7EFxxWHGoGwTmvxjIx840RDQMvw3/K+icU2HC54+uGZPlGak
         BvOHY51wCyqA5aOJ5RgpulT68trXiQi9p0b3u5yn+gNJKC1BzBqnp+Yojf6y31eDB4yF
         I9CNKyRrGp2aK6flFSiu4n0PuSnAGdwMCk7quCvVsL94DPch45lprQEVtXIzS/n/u83p
         js5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EEsEjaszIy6U1t2M0AT9FWo5sHsTueLI/JTM8CIT+Cc=;
        fh=5sDG3mwLWcBnOdP2dRA+Rbtcaqx6oezf7zF3rCGbyUo=;
        b=gGpuhrrlPuZbEY+U8D5kJMl9inrXe/7b9RPQ4gEh6yrZOYx6VW6WtojSrQDbGNFmis
         1CrY0WbusYQuUQkce0//zHg4krD7QGsKnP58s/CmUENCbyB8gyu/5UnSo1gbWb0dvonH
         ka+44Me23TdlGJq0PK0EugV1C74ANj8eZx5++hpHyPcHhSRnzh4X9iiQ2S5ZePF7HWM5
         uYSJKuZXtO53ydevDeYE6xQbUou8zoZkfYKVS6LrxSuhGUZX1D1sRClc84uPbG5/2co7
         2FNZEds2sLFnYx8EaCyMOgsuSkqx6sxq5CSVO3lISdgnL8OnsAkxbcIlhBOzz7Z6YO4V
         e+Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776230098; x=1776834898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEsEjaszIy6U1t2M0AT9FWo5sHsTueLI/JTM8CIT+Cc=;
        b=mG54uMr0TsQKx1KXocAfVD8V0Vqnh+Ne7LzHnTgerjFRAgoXR1AHoUuhI5nzI/L5Nj
         WwedGBVHnMCsYjPMsQ2HIJBvTRyibNFilmnwVzFJBswDcNXe0QedNGUIpCBDX+S46LER
         gT4QA8rLzQcgxglcRfpMgK14NLpjR/nHhL1lV/SjMolOFDABJRD9dTgaNLT+W5V0F0Fj
         gQGVDo3WaguxebcxK3OCCRkI2AtSHqLEChNz84p8rSBFs/sU9nlBHGyJH8LpIjJ7kJ81
         NnmzTy2ffnz9HtK4gCb5SnrdI8OxZzFKnE18xn7g4bwiSVsBarLQ0a1wsjx2/5+s8MYy
         wp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776230098; x=1776834898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEsEjaszIy6U1t2M0AT9FWo5sHsTueLI/JTM8CIT+Cc=;
        b=gBBJ+AdEjGTN+uTxUUy+MwMbEH8t1QvZnq97t/Rh+eaxLfqRd4dciMkKOABRGsKgbp
         KP9FRS1FEQPpWG7pzorHUR3RTnl3FarZkJhjNx66kCZEOr5PnXq3CA/+5VWpFZooGB5R
         MuwNWlVCv1ZADFyM0gXL9xt+8ieuzmOqMKnu2iYFY9sm1G+owrw6vGzfjcJ96kwLgI4G
         t7+KApC/5hUPOp7lLth3h3MNzyIVbhri+KAmD8YxOZIH2rOQA2guJ8yzLO7QyuInEHCX
         X38Zn5bfntfBpYJr/paQM1msrn3eiqy3m026eJYlTnpY3/BqFPK5oMv1Ez85O0u8VGw1
         1vDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bB2mlnqC9sguBNdICxkbMHnedx2qXraB65alDQA2JsM37ze232eWUzrQSCw22WnZHWBX1qrVkKmX5HwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxw2JjK7KxlEnbRY1LZPH+mhj362bIrJW2qHlLLa32XnJc8fi
	NJAsV7hnDQAQx8GB+ku/pPyWlGozhJcXQODtWv+IgRXF+McxKbRN4LZVtTWH+WcA/JNTi9PWJUc
	wmoYl+DmuXgIlSDNqKyUwptU8G6J0nEI=
X-Gm-Gg: AeBDiet1zqsM0XaMg5einYKccnFQDdc8WfLsAU6oXztg1XK12vCoCLrz5e3PmLHBzLQ
	VuCJXbsAWx9B/V+SjdGOxO3L1+km51dwIpVcuvNXcQ/Nwx/YA2kZI7U7T7o3ymdi8764MzG18s3
	FHCn5VQds//IZFwF6f+AP5JNxGrfSWQ8GinVFzAk8KFXxqWaOhbkJXuPy1DCSyr+YZ8a9uw2dlZ
	V6KWlY1lZvmJJ3LIqchaM0urk1ISBQlHUIwyJhcuFMnqPNtpNpaPJDh+biXyITOCSkR9+4dDfGj
	ANEBlpX74a4KbnbLICQJu88YP7SGJYk9h3UZkBxB2hb7XJmo9Vw3V3m1e1o2KhZdjEz0iUAMxo4
	2RDBZelf4Fv/httXAhczwOxVL1UTRqyeHT+U0
X-Received: by 2002:a05:6000:144e:b0:43d:c95b:c46f with SMTP id
 ffacd0b85a97d-43dc95bc595mr9486630f8f.38.1776230097765; Tue, 14 Apr 2026
 22:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410131343.2519532-1-petr.pavlu@suse.com> <20260414203418.GA1022044@ax162>
In-Reply-To: <20260414203418.GA1022044@ax162>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 22:14:45 -0700
X-Gm-Features: AQROBzB7aDoLUZcZIDwk4xH7Hwd8TPccwBB9YE5L3c-gyNToBmQS1K57YgPiZRA
Message-ID: <CAADnVQKnWftcW0gk8HgFPLXuBf81+mqHMMds3fRmXHgOrRE-1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild/btf: Remove broken module relinking exclusion
To: Nathan Chancellor <nathan@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alan Maguire <alan.maguire@oracle.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Nicolas Schier <nsc@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12787-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,iogearbox.net,linux.dev,gmail.com,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: B7F3B4006B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 1:34=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, Apr 10, 2026 at 03:13:29PM +0200, Petr Pavlu wrote:
> > Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enable=
d
> > and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODUL=
ES
> > to enable generation of split BTF for kernel modules. This change requi=
red
> > the %.ko Makefile rule to additionally depend on vmlinux, which is used=
 as
> > a base for deduplication. The regular ld_ko_o command executed by the r=
ule
> > was then modified to be skipped if only vmlinux changes. This was done =
by
> > introducing a new if_changed_except command and updating the original c=
all
> > to '+$(call if_changed_except,ld_ko_o,vmlinux)'.
> >
> > Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
> > in-kernel build artifacts") in 2024 updated the rule's reference to vml=
inux
> > from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
> > previous logic to skip relinking modules if only vmlinux changes. The i=
ssue
> > is that '$(objtree)' is typically '.' and GNU Make normalizes the resul=
ting
> > prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
> > retains the raw './vmlinux'. As a result, if_changed_except doesn't
> > correctly filter out vmlinux. Consequently, with
> > CONFIG_DEBUG_INFO_BTF_MODULES=3Dy, modules are relinked even if only vm=
linux
> > changes.
> >
> > It is possible to fix this Makefile issue. However, having the %.ko rul=
e
> > update the resulting file in place without starting from the original
> > inputs is rather fragile. The logic is harder to debug if something bre=
aks
> > during a subsequent .ko update because the old input is lost due to the
> > overwrite. Additionally, it requires that the BTF processing is idempot=
ent.
> > For example, sorting id+flags BTF_SET8 pairs in .BTF_ids by resolve_btf=
ids
> > currently doesn't have this property.
> >
> > One option is to split the %.ko target into two rules: the first for
> > partial linking and the second one for generating the BTF data. However=
,
> > this approach runs into an issue with requiring additional intermediate
> > files, which increases the size of the build directory. On my system, w=
hen
> > using a large distribution config with ~5500 modules, the size of the b=
uild
> > directory with debuginfo enabled is already ~25 GB, with .ko files
> > occupying ~8 GB. Duplicating these .ko files doesn't seem practical.
> >
> > Measuring the speed of the %.ko processing shows that the link step is
> > actually relatively fast. It takes about 20% of the overall rule time,
> > while the BTF processing accounts for 80%. Moreover, skipping the link =
part
> > becomes relevant only during local development. In such cases, develope=
rs
> > typically use configs that enable a limited number of modules, so havin=
g
> > the %.ko rule slightly slower doesn't significantly impact the total
> > rebuild time. This is supported by the fact that no one has complained
> > about this optimization being broken for the past two years.
> >
> > Therefore, remove the logic that prevents module relinking when only
> > vmlinux changes and simplify Makefile.modfinal.
> >
> > Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
>
> If the BPF folks want to take this since it deals with BTF:
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>
> Otherwise, either Nicolas can take this for 7.1 or I will pick it up for
> 7.2 when 7.1-rc1 is out.

Alan, Ihor,

As resident btf gen experts, Please take a look.

