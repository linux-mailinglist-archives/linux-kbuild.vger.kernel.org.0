Return-Path: <linux-kbuild+bounces-13596-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tzZFLOTqImrgfAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13596-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 17:27:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA86494C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 17:27:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=dZspgvhI;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13596-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13596-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5387430125E1
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 15:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F7E41931D;
	Fri,  5 Jun 2026 15:19:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1AC41360A
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jun 2026 15:19:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672789; cv=pass; b=ghhSx6lDgUsTrLs5FmwCqqWLxcFkwQWZTw0gODjeiR2zVunVB9rD2EdvR8hP/UT9WhzhZPTPHBOMz+P4RbHwdClAklVZlaXs+JBFuJ32765LJtEzdr9hoeLofsoJVjoIErcKFCZePvPPA8QoYcjhI4alXxB86QsyDQEX6jYPgm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672789; c=relaxed/simple;
	bh=ymFf/rEwZrJs5X9wKSO5OinbMUTtbF8uY2QhuC9pf7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWZr7DMzMiLahifhsp/dj72B4kDD6a04iO21MqwKRLVD0HjueGho9HYqe65zeGFmNdKVVAztkOpQTDei0ntbySkKeadiM39LCcWJq0ECToxEnsVSfzRo8+BqSq/uJmmtM3kWPV696sq9ZXhzMvLCXbB+GSLpevUm3JXGBKjqgVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dZspgvhI; arc=pass smtp.client-ip=74.125.224.50
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660e9ea26b9so2182473d50.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2026 08:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780672783; cv=none;
        d=google.com; s=arc-20240605;
        b=lBnHn1GmAK7BJ2mZuaCWsRfYe1RZZ9CJ74QevgaG7rOTZURzBON/fZFLN/+F5KEahz
         CXL7fVhmrDUL6J5DY92bjOMW10urNoZ4DrlUGzxYEEuAPVqkougsnlMFY3aBJSU73OWt
         qTs+sygWDlNEZhLKP1u6nQxJ04eeDQrDCtjHNAP6grd8zVyp+peaN+gubArj86VuVEQi
         fm9HXPAl5HIRqCafMVmDfB0kayycajsNKW+eiwN0whxQU+LR4LcG8Pm9pX1i0nmciesp
         M+ldISz2b0b8NueZmvQEsVlUpPOczN8UIj9T440ts6K9/liNS5BZOcqYiiAjEStPUXDy
         /Axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3m/KOQvsG1uJHDvO1PZnjraMcJuZMi2RUKvodsmX6gM=;
        fh=JvFs7U8Ic3WozRaFr+zT/4Q/9X6JHDVrew1P7Yjufw4=;
        b=QpNxlnWYVgMhNljcfJlyjlRDgKpLWdT87KG//cKlhQoxqchiaLnj5R59KLB9q1uTv6
         faXiBE892Ubooj7OhlkscCSQEnyRO++BeGlpJUq+/44oyvOwHnkaRSuriA3sGcU/raZA
         rDXelkg3FHE/hoH5+8tEXj6uR1wv6dz58plX8cZKloh7juVzL4R8HyP6hYlaxyTfcsE8
         Rw/0m9nrqL+rm1LuQhSNGakxysLiU9V6rq3Lrkq/S16n7kIPuTJMP5T+sX/d/ZjkhEwX
         njCZw11Aj24fjypDmtAM53md8QUKHJgDt2pfDc/gImizHsiUrG6y8dZEk9bHl6IIoQgb
         IoqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780672783; x=1781277583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m/KOQvsG1uJHDvO1PZnjraMcJuZMi2RUKvodsmX6gM=;
        b=dZspgvhImrxDp7hNtUv4CCE7zrL0eVUrG75rI5ARz6iuBvEA5jp1X7MtBl/PdZLcpl
         KR9WtqrKqv98P4+4sPm3nSZ2fVPOTtnfkFkZG0NwLBzbj6RnpnbpuBZ5/QONeGB89cAg
         fIGh96QMPkQ2BcbBa+4O13TX0gNFlTCgbz7UMMZqDq4LqThmcyelyW/tjAtG5O7KCyge
         gOTVqceu4XeorfE6ndB045Xz7yMWuThVMJAhec7gPLdRqj1S3HU+Yz89k/NYd7uvaOha
         GgPtlLY0VUgXpQMfYSd1gtlVWx/KnzKsYMU/++ayqn3btLoN3DaAlg/UaGEg/0QSOk/a
         rKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672783; x=1781277583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3m/KOQvsG1uJHDvO1PZnjraMcJuZMi2RUKvodsmX6gM=;
        b=NgeZVSWazGrmd+RrC1mpT5y9ebXSDVdk9L8SubQSixgQRdTWZRBMQtUNd61Pjsj9Z4
         efgCNHYNyWvgKTqCK6NUbHPMQwxlgGKpf0VP5D7LAbUBGuI5tUIsyLIkF9Dx94AltLJi
         sL0ipHtUU3lKD69i31OE74cMtWBdlEVDhahfqXb0gbMdB6wDYTQ/rkvsW5hLa8jCUsGe
         2hqTlnB0HOXOfOS0lAlLv2ncwyMAN8Ab5dJfpY3mRaF6tS5bxxcMGjfiRHuBs4Jj/w8n
         21k82jyiVQTlJLhN9ftXwKDa5Cb0OC8N0Pft8b1m1b1t63uGfC25OicMDu4UEEFM5Mtu
         dpIw==
X-Forwarded-Encrypted: i=1; AFNElJ/sZFz0HshHp6xaRP5rjQ+ItjUZ3EGyVQNW/o4HlXLx8A6+rCVCKuN7v54i9qCE/LIbEZ3GrB6a2rSzbTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylqxEnybLC1pMsJx8+w5jZ3BAVCfRoslm5x+s9LT16asz/gZRQ
	xdgUd7WuLu0FA8YJbrlQkdsBrZIsrd1R8V8LfyPaXHqBBIm2oLKEpJlip2ApjaC0W/bex1nlSEv
	vfwMSkYlCim7O6CRbvVFvbbRwiKONvKxYUtPmJF8D
X-Gm-Gg: Acq92OEiBby3/V0phR1fDSzQURj9qqtTN9+ESvqdg9DmpsOY6nszjy389+ZhQjwpiVb
	QGS2TFEFRPL+Dm3euCcF6odmbR07r4TjfpPa3y1Tqz3WS2z89rv11LqiF3Tadg6AFs0uVW6xnYk
	sSzSdMsYre2W6DiRiirIVkQt0btCNyUz6Hzpv9wShmukyV9v/nzMI/CxnTRVu3/dubP4aClw/qK
	mYJYUj/8ISrUuLQf4vsAz1RVPCNlihF1LEeHr65ZBheilSMIwni+nvYRcMf4flMWy6E8VlhUyaW
	y2NmUu17rqOsb108FNW4hrNHawa9bmLC3jrXqN1Wik/BqGD9oKc=
X-Received: by 2002:a05:690e:1c07:b0:64c:9f31:e33 with SMTP id
 956f58d0204a3-66106fbfa70mr3468603d50.65.1780672782001; Fri, 05 Jun 2026
 08:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-4-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-4-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:19:01 +0200
X-Gm-Features: AVVi8Ceblw1PVlq_JOUX8fDH6TRKq7cz66at-ID_frny8QXhTeItWJGDPY83a0I
Message-ID: <CAG_fn=UTFnM60LVABGR-V0NwYc4d9C4KAhT4A_+oxduJcSeqew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] tools/kcov-dataflow: add userspace consumer
 and test modules
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13596-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1AA86494C0

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add tools/kcov-dataflow/ with:
>
> - trigger.c: userspace consumer that opens /sys/kernel/debug/kcov_dataflo=
w,
>   mmaps the buffer, enables recording, triggers a kernel path, and dumps
>   the captured TLV records.
>
> - kcov-view.py: visualization tool that parses and pretty-prints the
>   binary TLV buffer with struct field expansion and symbol resolution.
>
> - eight_args_c/eight_args_mod.c: stress test with 1-8 argument functions
>   verifying correct capture of register and stack-passed arguments.

I think the tests should better go to tools/testing/selftests.

> diff --git a/tools/kcov-dataflow/.gitignore b/tools/kcov-dataflow/.gitign=
ore
> new file mode 100644
> index 000000000000..1f35df8fbd07
> --- /dev/null
> +++ b/tools/kcov-dataflow/.gitignore

I am not sure about the conventions, but a bunch of other .gitignore
files have SPDX headers.

> diff --git a/tools/kcov-dataflow/deep_module/Makefile b/tools/kcov-datafl=
ow/deep_module/Makefile
> new file mode 100644
> index 000000000000..6afed580dc9a
> --- /dev/null
> +++ b/tools/kcov-dataflow/deep_module/Makefile

Makefiles must have SPDX headers.

> diff --git a/tools/kcov-dataflow/deep_module/deep_chain_mod.c b/tools/kco=
v-dataflow/deep_module/deep_chain_mod.c
> new file mode 100644
> index 000000000000..786e23c5d213
> --- /dev/null
> +++ b/tools/kcov-dataflow/deep_module/deep_chain_mod.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * deep_chain_mod.c - Demonstrates kcov_dataflow tracing through 10 nest=
ed
> + * function calls. An attacker-controlled "offset" value propagates from
> + * the entry point through transformations until it causes an OOB write
> + * in the deepest function.

I don't fully understand the purpose of this file. Are you going to
parse its output for testing?

> + *
> + * Call chain:
> + *   entry_handler =E2=86=92 parse_request =E2=86=92 validate_header =E2=
=86=92 extract_payload =E2=86=92
> + *   transform_data =E2=86=92 apply_filter =E2=86=92 compute_index =E2=
=86=92 lookup_slot =E2=86=92
> + *   write_slot =E2=86=92 commit_write (BUG: OOB here)

Call me old fashioned, but I think we can easily avoid the non-ASCII
characters here.


> +/* Function 10 (DEEPEST): The vulnerable write */
> +static noinline int commit_write(struct slot_table *table, u32 index, u6=
4 value)
> +{
> +       /* BUG: no bounds check on index =E2=80=94 if index >=3D 8, OOB w=
rite */
> +       table->slots[index] =3D value;
> +       return 0;
> +}

Does this call chain need to be this long?
I assume it was extracted from some real-world example, but maybe
pruning it to 3-5 calls would demonstrate the capabilities of dataflow
tracing just as well?


> +
> +       table =3D kzalloc(sizeof(*table), GFP_KERNEL);
> +       if (!table)
> +               return -ENOMEM;
> +       table->num_slots =3D 8;
> +
> +       /* The tainted data flow:
Please make sure to conform to
https://docs.kernel.org/process/coding-style.html#commenting

> +
> +/* Trigger: constructs a malicious request that causes index=3D12 (OOB) =
*/
> +static ssize_t deep_trigger_write(struct file *file, const char __user *=
ubuf,
> +                                 size_t count, loff_t *ppos)
> +{
> +       u8 *buf;
> +       struct request_header *hdr;
> +       struct payload *pl;
> +
> +       buf =3D kzalloc(256, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       /* Craft malicious request */
> +       hdr =3D (struct request_header *)buf;
> +       hdr->magic =3D 0x50524F54;       /* valid magic */
> +       hdr->version =3D 1;              /* valid version */
> +       hdr->payload_offset =3D 16;      /* offset to payload (valid posi=
tion) */
> +       hdr->payload_size =3D sizeof(struct payload);
> +
> +       /* Craft payload that will produce OOB index */
> +       pl =3D (struct payload *)(buf + 16);
> +       pl->session_id =3D 0xAAAABBBBCCCCDDDDULL;

Much is happening in this code, making it hard to review, but all
these values do not seem to be used anywhere.


> +
> +noinline u64 func2(u64 a1, u64 a2)
> +{
> +       return a1 + a2;
> +}
> +EXPORT_SYMBOL(func2);
> +
> +noinline u64 func3(u64 a1, u64 a2, u64 a3)
> +{
> +       return a1 + a2 + a3;
> +}
> +EXPORT_SYMBOL(func3);

Would it be more readable to use some macro magic here?

E.g.:
```
#define DEFINE_SUM_FUNC(n, sum_expr, ...)           \
noinline u64 func##n(__VA_ARGS__)               \
{                                               \
return sum_expr;                            \
}                                               \
EXPORT_SYMBOL(func##n)

DEFINE_SUM_FUNC(1, a1, u64 a1);
DEFINE_SUM_FUNC(2, a1 + a2, u64 a1, u64 a2);
DEFINE_SUM_FUNC(3, a1 + a2 + a3, u64 a1, u64 a2, u64 a3);
DEFINE_SUM_FUNC(4, a1 + a2 + a3 + a4, u64 a1, u64 a2, u64 a3, u64 a4);
DEFINE_SUM_FUNC(5, a1 + a2 + a3 + a4 + a5, u64 a1, u64 a2, u64 a3, u64
a4, u64 a5);
DEFINE_SUM_FUNC(6, a1 + a2 + a3 + a4 + a5 + a6, u64 a1, u64 a2, u64
a3, u64 a4, u64 a5, u64 a6);
DEFINE_SUM_FUNC(7, a1 + a2 + a3 + a4 + a5 + a6 + a7, u64 a1, u64 a2,
u64 a3, u64 a4, u64 a5, u64 a6, u64 a7);
DEFINE_SUM_FUNC(8, a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8, u64 a1, u64
a2, u64 a3, u64 a4, u64 a5, u64 a6, u64 a7, u64 a8);
```

You could as well define the function prototypes instead of applying
-Wno-missing-prototypes.


> +{
> +       pr_info("func1(0x11)=3D0x%llx\n", func1(0x11));
> +       pr_info("func2(0x11,0x22)=3D0x%llx\n", func2(0x11, 0x22));
> +       pr_info("func3(0x11,0x22,0x33)=3D0x%llx\n",
> +               func3(0x11, 0x22, 0x33));
> +       pr_info("func4(0x11,..,0x44)=3D0x%llx\n",
> +               func4(0x11, 0x22, 0x33, 0x44));
> +       pr_info("func5(0x11,..,0x55)=3D0x%llx\n",
> +               func5(0x11, 0x22, 0x33, 0x44, 0x55));
> +       pr_info("func6(0x11,..,0x66)=3D0x%llx\n",
> +               func6(0x11, 0x22, 0x33, 0x44, 0x55, 0x66));
> +       pr_info("func7(0x11,..,0x77)=3D0x%llx\n",
> +               func7(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77));
> +       pr_info("func8(0x11,..,0x88)=3D0x%llx\n",
> +               func8(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88));
> +       return count;
> +}

The inconsistent output format here suggests that the output is never valid=
ated.

> +
> +static const struct proc_ops ops =3D { .proc_write =3D trigger_write };

This file should belong to debugfs rather than /proc/.

> diff --git a/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs b/too=
ls/kcov-dataflow/eight_args_rust/eight_args_rust.rs
> new file mode 100644
> index 000000000000..11bbe1449eaf
> --- /dev/null
> +++ b/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//! Verify kcov_dataflow captures 1-arg through 8-arg functions.
> +//! Write to /sys/kernel/debug/test_args_rust to trigger all 8.

Please make sure triggers for all your tests are consistent,
preferably somewhere under /sys/kernel/debug/kcov_testing/ or similar.



> +
> +Reads both /sys/kernel/debug/kcov (PC trace) and /sys/kernel/debug/kcov_=
dataflow
> +(args/ret), correlates by PC, and produces a human-readable call trace w=
ith
> +argument values and struct field expansion.
> +
> +Usage (inside guest or with appropriate permissions):
> +    python3 kcov-view.py <trigger_command>
> +
> +Example:
> +    python3 kcov-view.py "echo x > /proc/uaf_trigger"
> +
> +Output:
> +    func+0x0 [module]
> +      =E2=86=92 a(arg[0]=3D0x1, arg[1]=3D0x2, arg[2]=3D0x3, arg[3]=3Dstr=
uct{.f[0]=3D1, .f[1]=3D2, .f[2]=3D3})
> +        =E2=86=90 ret =3D struct{.f[0]=3D1, .f[1]=3D2, .f[2]=3D3}
> +      =E2=86=92 a(arg[0]=3D0x0, arg[1]=3D0x0, arg[2]=3D0x1, arg[3]=3DNUL=
L)
> +        =E2=86=90 ret =3D 0x0
> +"""
> +import os, sys, struct, mmap, fcntl, subprocess, re, ctypes
> +from collections import defaultdict
> +
> +# Ioctl definitions (x86_64)

Why is this code x86-specific?

> +def parse_dataflow(buf, n):
> +    """Parse TLV records from kcov_dataflow buffer into a list of events=
."""
> +    events =3D []
> +    i =3D 1
> +    while i <=3D n and i < BUF_SIZE:
> +        hdr =3D buf[i]
> +        typ =3D hdr & 0xF0000000
> +        seq =3D hdr & 0x00FFFFFF

These numbers are used more than once - please declare them as
constants instead.

> +
> +        if typ not in (0xE0000000, 0xF0000000):
Same here, no one knows what these numbers stand for.


> +        while i <=3D n and i < BUF_SIZE:
> +            v =3D buf[i]
> +            vtype =3D v & 0xF0000000

Please use helper functions to extract the type, size and whatnot.

> +            if vtype =3D=3D 0xE0000000 or vtype =3D=3D 0xF0000000:
> +                break
> +            fields.append(v)
> +            i +=3D 1
> +
> +        if typ =3D=3D 0xE0000000:
> +            arg_idx =3D (meta >> 56) & 0xFF
> +            arg_sz =3D (meta >> 48) & 0xFF
> +            ptr =3D meta & 0xFFFFFFFFFFFF
> +            events.append({
> +                "type": "entry", "seq": seq, "pc": pc,
> +                "arg_idx": arg_idx, "arg_size": arg_sz,
> +                "ptr": ptr, "fields": fields
> +            })

This looks like it could benefit from OOP.


> diff --git a/tools/kcov-dataflow/trigger.c b/tools/kcov-dataflow/trigger.=
c
> new file mode 100644
> index 000000000000..7fa7b4414770
> --- /dev/null
> +++ b/tools/kcov-dataflow/trigger.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * trigger.c - Uses /sys/kernel/debug/kcov_dataflow to capture

This code seems to partially duplicate kcov-view.py, do you need both?

> +#define COVER_SIZE (64 * 1024)  /* 64K u64 words =3D 512KB */
> +
> +static void dump_buffer(uint64_t *cover, uint64_t n)
> +{
> +       uint64_t i =3D 1;
> +
> +       printf("=3D=3D=3D KCOV Dataflow TLV Dump (%lu words) =3D=3D=3D\n"=
, n);
> +       while (i <=3D n && i < COVER_SIZE) {
> +               uint64_t hdr =3D cover[i];
> +               uint64_t type =3D hdr & 0xF0000000ULL;

Maybe we could use unions to unpack the header?
I don't mind the masks either, but please declare them as constants.


> +int main(int argc, char **argv)
> +{
> +       const char *trigger_path =3D "/proc/uaf_trigger";

I couldn't find /proc/uaf_trigger anywhere, does it belong to this series?
If trigger.c is a general-purpose tool rather than a test script, it
shouldn't depend on the test modules.





--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

