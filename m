Return-Path: <linux-kbuild+bounces-13753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a7RmFtWAMGqXTwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13753-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 00:46:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB268A773
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 00:46:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=nZcVJA3o;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13753-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13753-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12B01306B7AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jun 2026 22:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3613264CC;
	Mon, 15 Jun 2026 22:44:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0471E9B37
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 22:43:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563441; cv=pass; b=L0IlhiLuY478qXxNJ024nmbAKdIA9QdCCvhTiPOz+CdL48GJjTqOg+blM/J5GfSFPGyRzSgc1IfotsyzyhkLYdYbdn5buhEey1ROrqu6IlSkWs1IfJffJkT7kYO2If0DihvXeTVhHe6KxbeGoYK54wTMEHLTgHHlbiqDjDtFybE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563441; c=relaxed/simple;
	bh=LqRnFrlsVSN6Z5AojpUM9t+oOQCqUIrL1z0I/VtoBLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahl/5cYaXF5Chyz+N78e1pu73JXu35grDYlvGyr45ecdprQ88vwBeKCq/9OT6QbR2Osctk++7bo+eZcmKrKu9y9PWHX5+4OabsFhtR2FIx5YHZUc2981vbNF3gOoD/UWgJPXlLoB/7jEoqXEnrNCryl6jmNuWJLVcMsYxDSoUtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nZcVJA3o; arc=pass smtp.client-ip=209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso4335a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 15:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781563438; cv=none;
        d=google.com; s=arc-20240605;
        b=jS3T0fcat2dWG/Ml9J+A1SdmWxeyrNJjmtP1DCTSjopjkzBPRWzsU+/3KZhjWWYRTY
         zhfgtItxYcy6nuiX+w/x+fiH1idZbQLHwvIrGtSlFb6wz7Ylz0JA1sEXWa/w/lPoC/JR
         myhtEQoQ+xs6b3gzIn5WvWgodDBE0JlrEI9n7VPSJZo4S5VQTZEXwmfbi786n8lirxt4
         1aw0l/qSSq5fAfi2OELkVv86o6hMXMO37hfp3TAeoXIDLL4nOXMC2iuCkgEQu+87CGzW
         B5XyT+OFaSD0ri8feNvoyt+gfLoxp7MewHoynp0wPLaUezHVk5+Qcb4RNbF6/aK3ibH1
         hIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LXbAkErLo8X6OGSJ4eYUYPXvYTMqhOvYqhkz8XAM1bw=;
        fh=RF+hBtqbH0WLzx9FbsipZ0dF7qzbRInlgavMAPojp0g=;
        b=TokMUiJuvjz631HR5s7ZNaga05icq82eCtb0adDWLYT19hMCM4Dah/S5uCfMdm1mFA
         KiXfu1G01rxRzT3LXuOknRVw/o4hzvmd+nT7kpMkpiQKMUAUGNNAkzmUkMCpiUrS0kmI
         6PA7yA6r8QOoLE+QhwRjNYecrqCpaVeqlZPZn3rhL+y3qrkqSM1zSVHvnh6gyuX7Xjq/
         +o42LYX1ryuVzv/xhZyT1L9rv3akY+pPVIaxRQ1yQfIQ/UrE11/7FfQ153kr2RZq2Lo2
         HBo/UgFU5/olhPGowfEzBsS+tAbDMQdjZJdXqwAGCO4ttCzAYoBpNMoIRNpUVJwkmIzN
         jCFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781563438; x=1782168238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXbAkErLo8X6OGSJ4eYUYPXvYTMqhOvYqhkz8XAM1bw=;
        b=nZcVJA3ojdxRFnNyfWw7rNaKGKHUNvszn3Okc7LKS8tbUqPxChyNiszC7mb4cD01Sx
         d6VFMU7UvTFEI+9LEG+HrMXmPb3Po509PxjQPkO9uMVmRFcyA7ry9OMLlQ72ez+hUkAs
         mKYOx4AoySUDqEnyAxzD7EWY17OnNddXfp41i+6AALF5w28SkcUDi3zPVz+TB9tNrKpb
         wluaRdNSjxzUIfpGXR7dTanQG7km8umoevwz8xhJWOShB8ogjv3q68CeyaPKBhXyslxN
         2S00ceyDuxSeY1AjA6tbJ8045DGQ40zCCjsRM9aN/MQnwz427MmjaoTE6lRC9i1GroJh
         mQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563438; x=1782168238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXbAkErLo8X6OGSJ4eYUYPXvYTMqhOvYqhkz8XAM1bw=;
        b=nLa9MT5KFEqCwFr9DsMOkHx5herhIQZW6RoTqKSS92CSJdshPFCHB2YuWPRXvLeVZy
         xCTMVMAiQ2ji5YL5gHjNflX1xHsKOxgBCSyZcICwHhIvxRJIEBUsfBl4TZgAiKyVt0hJ
         tesjji2q9g0R8RMn5/EJoUPGkg37nLG8fzFMFyHO1fveuuBFzQ9Z9HhqHA3apTL7o/aX
         XDlrgFIzYys0+c/vdFqspZgJZ3PM3427WSrIAj548DkCUqvRTifZ7TUMw24rICwMVH4b
         NHkYFshC4f/nBYSxmIhAy/ftjqh7ncaw10CwsyOvgZV+s/gW36PH75gSPwxqwo5dCFC6
         Cmrg==
X-Forwarded-Encrypted: i=1; AFNElJ9M148jz5kvi26GGBAhzv7QSnQdUxTU7s3uSWhfGOo6VN8UrMsNJICmOscoCMOTO3RnJBWOt0Du6HlI598=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhnLjYgMMJR6A1Nk+T6d8HmqNg50Tysx9yxQur37TbSho4rCu
	TqLnywnEjJWSADTHrTlWq+lQpQzQ0xbOzWnxtPk4wxMlBNyLsqGyeX7iu4oNaKPtLfYWfK9Ycxq
	ILdbDoVZf4ueHxdE84pn5jW63ysWCJuufg21/mn8G
X-Gm-Gg: Acq92OGlevVzXLEi3IYotH53LWz67kHCZGIxwC3MinE5GJY6Cyucv/2nfFmn51xMyOS
	4EY89Tw/iF68pAm7XzsFhD7ndqSeGqubhgx1zBHXMXpjA0CFIfdSByxz2LC8tbXvpdl4Z7n0/dZ
	z3p5LpP3iYn04ziv4iDmkLuJjBzb59sndOD5Zzd/rmP+cJJIJ0qbSHYkADQcLIHUMtoJnHBIpLz
	wP7Ul8XQ5xYLkHC9Sk/Hfqp+lISRZiMCRGrmskUZJyKOoXIBZ5BSAQXM5V9f0IE86FDW0KFJm5f
	hY7szuir6ytKJ8ZxGJK/Hi88cvpgS51MiGbE2w==
X-Received: by 2002:a05:6402:a21a:20b0:671:dad9:8caf with SMTP id
 4fb4d7f45d1cf-6950f6d13aamr7823a12.5.1781563438075; Mon, 15 Jun 2026 15:43:58
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615222019.4116687-1-xur@google.com>
In-Reply-To: <20260615222019.4116687-1-xur@google.com>
From: Rong Xu <xur@google.com>
Date: Mon, 15 Jun 2026 15:43:46 -0700
X-Gm-Features: AVVi8Cdx2-FNEk-6V92cqNAvXpfnn9AuqvdTdLKhdKePA0rbNDur1QbFJ4SR_10
Message-ID: <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	=?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:samitolvanen@google.com,m:sidnayyar@google.com,m:petr.pavlu@suse.com,m:jpoimboe@kernel.org,m:xur@google.com,m:edumazet@google.com,m:rene@exactco.de,m:legion@kernel.org,m:johan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,suse.com,exactco.de,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13753-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4EB268A773

A more direct fix for the warnings in
https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
looks like the following. But I believe the solution provided in the
patch is more comprehensive.

-Rong

=3D=3D=3D=3D=3D=3D
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..1f0a379b43c8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
const char *fromsym,
        /* symbols in data sections that may refer to any init/exit section=
s */
        if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
            match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
-           match(fromsym, PATTERNS("*_ops", "*_console")))
+           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
                return 0;

        /* Check for pattern 3 */

On Mon, Jun 15, 2026 at 3:20=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> When building the kernel with Clang ThinLTO enabled, the compiler
> can mangle static variable names by appending suffixes such as
> ".llvm.<hash>" to prevent naming collisions across translation units.
>
> This name mangling breaks the section mismatch whitelisting in modpost.
> modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
> safe references between permanent data and initialization code. Because
> the LTO suffix modifies the end of the symbol name, legitimately
> whitelisted structures fail the match, resulting in false positive
> warnings.
>
> For example, a static pernet_operations struct triggers the following:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: \
>   ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
>   ping_v4_proc_init_net (section: .init.text)
>
> Fix this by stripping ".llvm." suffixes from the symbol name in match().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@i=
ntel.com/
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  scripts/mod/modpost.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..1f5a64eeb048 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -727,6 +727,18 @@ static const char *sym_name(struct elf_info *elf, El=
f_Sym *sym)
>  static bool match(const char *string, const char *const patterns[])
>  {
>         const char *pattern;
> +       char string_stripped[512];
> +       const char *ext =3D strstr(string, ".llvm.");
> +
> +       /*
> +        * Clang LTO can append .llvm.<hash> to a variable. Safely strip
> +        * the suffix so glob whitelists (like *_ops) work.
> +        */
> +       if (ext && (ext - string) < sizeof(string_stripped)) {
> +               strncpy(string_stripped, string, ext - string);
> +               string_stripped[ext - string] =3D '\0';
> +               string =3D string_stripped;
> +       }
>
>         while ((pattern =3D *patterns++)) {
>                 if (!fnmatch(pattern, string, 0))
>
> base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

