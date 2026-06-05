Return-Path: <linux-kbuild+bounces-13598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yjj7DAv4ImqTfwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13598-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 18:23:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E712649B99
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 18:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=WYw2iXHO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13598-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13598-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39AFA306942F
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A683E5A32;
	Fri,  5 Jun 2026 16:06:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BEA394462
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jun 2026 16:06:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675576; cv=pass; b=Rlfn/I6UzC8tvvuBt34pvDRki15Jx0mFE4OrNLmg5e0tzQVZBWSZnCrxMYh6Y+98jtbejjJME/MqzfmKXrZlNSjppnLfoMZPubnYQKueO2IBBrS6JwHLqMGHLLehS72xW6cGOSoV13tJfeo5YGY6C3OmChnco4w13S2osu0rzo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675576; c=relaxed/simple;
	bh=CYocm5u0+pg9o3aIVAE3m5a3oTIe6F5o9fKMKsoF8EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rh2x083tktdm0l4AB2kHTG9CngXb0r7+qz6cAxo/DHkk86frWbuPRhus59xO7ryYEkZOJ+3HKs/qb3sX97HpZaXG0Rm/11QSk9nhiT9JfWQQ1mrO3L0eEJyOqNLPe56Iumlv0L7XdfRlI6SaaB+3jXEVbHBaVF44tKEXJGxcyas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYw2iXHO; arc=pass smtp.client-ip=74.125.224.44
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6611669cd16so120254d50.0
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2026 09:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675574; cv=none;
        d=google.com; s=arc-20240605;
        b=eUXdtvOn39eTrSCAhzRCq1/w+6G8N72yIGmPNSb07e5hUlpol1t3Mk2OtYBXgJWw42
         rfKeYSH5ASsMPkp6wJGz+fxFbu5MvEmcSm1NbtmS2NU9/JYaMScwzgK/gV6IFdHn5map
         0r56uXwJdM6fz5T2GbjfNxLV+H+gF3NTadYkNFgWAOadR24ziX7n/me6E2i8OesrMz/e
         EDQ5Pa80e6L7UphL3vZXzOmISQg07vGa96LZKQJf7XIDfE3sO7+Fv3CNTNDMnQdTBkqj
         m+1HvZ5WL5PTt+nlVLtxK+jz92nPqMLTaLpe1NlsBjH6DexHsyppFfPxPkdD+qu26iLX
         p2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        fh=CuczmC0yNwl3ZIvb8dJDZTIbbA+86IBrVSKioh1kDck=;
        b=lcSLXBhxWodLwTDtRGUd+3Kb62YXf/TwrjLttpEnCJEvmV+8jiuwfoUkU05l9/mjI6
         3IUQIsP6tNXWWnZ66ODTixhMQTG8ySzeYBSVtwSMeQCQChXIQtfPxfmmypnqTmzomaIr
         0a+vyVI67LIxUYPvgm0xmeQ6Icb93/CKp5CDBjaXln6q3sagaioW4lOKUAOGjv+Sq3qB
         mdoiFyZaVTnf7mNQGWZ0PSwcezaFAttYobqPr/AkGecMjacyyWX1yieQBwL2x1uKs2qG
         bcyVN81Z0QGw8oh6LJ6yXVOZ2OOeeeSKtsmTcxvLXP2E1x6jNDYxirAP1rex6pgb63B6
         DlBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780675574; x=1781280374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=WYw2iXHOew+BVshvJs3UfrU4HFPekt6Fb8/tqKm4amfDigUZ6hWHjh7r8YmjoU9Ce9
         fBHImGVFkweW4lLujv8L1j3m0/zSU9xH6jtigm2fcG96IxbZIqOpUMWi7lliz0/Hrtnk
         vevzrHl0YIIsR/g7BcnK3ryi1PLU+zA4Q/NgwHHv+XEsErNfiJK2fpTL8tpYeGAdhZjd
         jZp/Rp4d68R4LkJB4UHFMslX+FEClMg1Zdt4YADT+WQ6HPD4x0ptwJ4yTKrEaw1M/YLy
         08DZyxvggsVzvq4Eqjvw8U7OiQWeMk7jdRsrmh2m/UpyZI5Pf6uu6ZZtKerOAGuVB1fM
         md5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675574; x=1781280374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=J2zNlMeKsZyvKviKneXBtXenEIWLTd3F6Nxj3fiMy3OBkXqeIT3MfJ2Td/VI4skH1s
         ijR7PX3y9mfgxwSYP3Rhph7JhVQRZDTQdWuSTwh26E1bXH4QVy7/O+qqSiJ2a3gJCDg8
         0/J8YMsJW+Mzow1zdajQNiluEvj42mq0kDVTYzyQQ9aeUG89wmFT1jXlbQJ0k7PQCeH9
         6PKIhR0J+QiMaJYZUKaKl1Xa76TVU8QUTBFoQthOArEEBz+5/Zu22ARUPk1t98Sejp+R
         OwB7FeJMN0zq29trH8D0TN2RPEA0mYeZdFfgEp5nyOXlZ62pc7f7ZnpgTj3J7V5bnznd
         iX2A==
X-Forwarded-Encrypted: i=1; AFNElJ/0cW9IxuvC3Fm4bzj6rx+Cb06fQRPu7eeU4GCgxqn0k7zZ8bRLDUb0qQXMB8j159VblpOfm/NCggJz+Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLk7iynG4nJk4r1VrVKI+PecRhY4OZ0lEiykLPSrCROcLonUeg
	oM3mubLzJNG6c3o/x4HemwPflojw3l0kiTRRGm1O+khBwV4ILkIqBziQVHOA7mhGCeY+b8Je+tj
	to6NeknNtOqgD2Au6SOAtbZ0BBJPDg4TgjyBvP1Tf
X-Gm-Gg: Acq92OGmqvgZLiExghs5ZzQV2Kux/vMGCmdAoulQPsv/JB/v1b2Xa+gaO6p3ny1t1ma
	hsZxJLMrWDTsRylBEikzgmQ4iLb8SRj58lly+94pjfghiYsvwyjIhef47v9MYHpFBlYIJlm16T4
	zIWUUGsHKq8dlxMUbG8wvcEgu3pLBp7rQzvk5cHXg/psJ1BdgyCXOV7IMVm1uEc5YJoGz4zGIRT
	olNFma5vxcQdQ5SshXvh0SAspzpPAuwsJkO9kmApW4VKBKWbXsef812W+08k911tv6LbB0OlSoc
	sw6QAjMM4tYCHn0osIoBUkxLVGbKraRqWHwg3rG7svcPnZfervI=
X-Received: by 2002:a53:e306:0:b0:660:3426:3ff1 with SMTP id
 956f58d0204a3-66106f583b0mr2916376d50.34.1780675573532; Fri, 05 Jun 2026
 09:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:05:34 +0200
X-Gm-Features: AVVi8CdtIWJrRUEJnQQQB7BanVCY0Gd9ha8SThOa2A947QiJHGGMsBgLigo__P8
Message-ID: <CAG_fn=UMJJz+3zipowaC4uTvcbC0gvXbBRaF0UUJ_1AW+oWNGA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13598-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,est.tech:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E712649B99

> - Per-task buffer: task->kcov_df_area with atomic xadd reservation

I don't understand this line...

> - Recursion-safe: notrace __no_sanitize_coverage noinline
> - ERR_PTR aware: skips struct expansion for error pointers

... and this.

>
> The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
> compiler when -fsanitize-coverage=3Ddataflow-args,dataflow-ret is used.
> The Kconfig options depend on cc-option to verify compiler support.
>
> Buffer format (TLV records, all u64):
>   area[0]: atomic word count
>   [pos+0]: type_and_seq (0xE=3Dentry, 0xF=3Dreturn in upper 4 bits)
>   [pos+1]: PC
>   [pos+2]: meta (arg_idx | arg_size | ptr)
>   [pos+3..N]: field values read via copy_from_kernel_nofault()
>
> This is completely independent from legacy /sys/kernel/debug/kcov.
> Existing users (syzkaller, oss-fuzz) are unaffected.

Does oss-fuzz even use kcov?

>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h |   8 ++
>  kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/Kconfig.debug     |  22 ++++
>  3 files changed, 321 insertions(+)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c4433c185ad8..03be4b495f70 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1533,6 +1533,14 @@ struct task_struct {
>         /* KCOV sequence number: */
>         int                             kcov_sequence;
>
> +       /* KCOV dataflow per-task sequence counter for TLV records: */
> +       u32                             kcov_dataflow_seq;
> +
> +       /* KCOV dataflow: separate buffer for trace-args/trace-ret */
> +       unsigned int                    kcov_df_size;
> +       void                            *kcov_df_area;
> +       bool                            kcov_df_enabled;
> +
>         /* Collect coverage from softirq context: */
>         unsigned int                    kcov_softirq;
>  #endif
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 1df373fb562b..d3c9c0efe961 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 =
val, void *arg)
>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>
> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_R=
ET)
> +/*
> + * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
> + *
> + * Completely separate from legacy /sys/kernel/debug/kcov.

Since this code is completely separate, could it be put into a separate fil=
e?
I think kcov.c is too big already.

> + * Own buffer, own ioctl, own mmap. No printk =E2=80=94 buffer only.

Can you please not use these long dashes in C code?

> +/*
> + * Core write function =E2=80=94 no printk, no locks, just atomic buffer=
 write.

I think it's okay to omit what this function is not doing.


> +
> +       /* Atomic reservation */
> +       pos =3D 1 + xadd((unsigned long *)&area[0], record_len);
> +       if (unlikely(pos + record_len > max_pos)) {
> +               xadd((unsigned long *)&area[0], -(long)record_len);
> +               return;
> +       }

Have you tried compiling this code on ARM64?
I am pretty sure they don't have xadd(), so it won't work.
But why do we need an atomic increment here at all? write_comp_data()
performs the same job, and does not need it.
Or am I missing something?

