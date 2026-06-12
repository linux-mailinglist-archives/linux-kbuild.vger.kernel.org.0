Return-Path: <linux-kbuild+bounces-13723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioMcEb+1K2rTCQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13723-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:31:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B16773C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:31:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=L58aOBc1;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13723-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13723-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672A03106924
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2F53D75A0;
	Fri, 12 Jun 2026 07:31:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6082534BA20
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 07:31:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249464; cv=pass; b=Xt9fRFtHxqt3BT+BD27QoiJaP8HGEkyHYOMmP3PN0rwZxoV8O/70qgt77BQu4qimSY86cQGFf4PoIGcUmXkYBE2M3nAKTfAj1ou7mmz0KSFsLcpKF7jgVJUk5K/8CWCj2moUNa0xGpXnBvLA6UtLGUyxf2FxkyqPP4QGAsDlX4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249464; c=relaxed/simple;
	bh=TJhwC0TjtETgO7UDDcPQsbkdSGcQTc0ybmTI+jD//dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xec5gRO8t+48/PTZjilkSzjyLvucWHo7BSymRV/Z1VjPWJVaV6kve8EleFX5OJcC/NZArEkns+tjjidoatey/I5fTjH98ge9T4GyOIyS+ZLUwLz8hSEC5mqZXXrxEovfh3YnQQWTZJP2FO8rvRh7tqNl5o5qgT+KZ9ngedOioe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L58aOBc1; arc=pass smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so1229273a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249462; cv=none;
        d=google.com; s=arc-20240605;
        b=aFhMab3zDzAsuERa8RKjsN/F3/GwKsl5ApyiBWNhiXML3J2cPQsIYR72G3WtS4z+pe
         bS3sgB+JUvIBRm+dNNJV2W7XIFdAkTVnZINtpiU7DLgZghoTT5O+HGZlYFt3bV4RGVqQ
         7F/VSDuw6VFJN9h5kn3qnIdCi4U+XETw4Z60mGxxT3561CuVx6wLlsGFp/XbUWCCbryX
         8ltWrmy9x+gE6yaXj6wPuygd4Dd7faTEdGBE7Smn9hSXJnDShtjAShobUazYrmLILDNu
         KfjUvsg5xl7Yr01p02xhWHI16b572pN/8WPwaDWVejn8ynBIWQ3vWiTj49wdOYDl+jQI
         Ze0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        fh=rk7NR53sIqwMaxqWCnDFK2HopPwlPKR1Re+bAFg3q8I=;
        b=fWKf8MzH9X55WCwjy5qxd7dBf5OTtF4/S7W1/G8S3ec3+7Vt3xkOYBkZqxme0Zeoco
         Qgp/6hc4rQNATusgj7Egrb64AQhGo7lWpRqbbGFFOoF2YWruZXGyrifLfX2uTJkg4FKP
         yK7pjKgSpiGwIZReOyRUd8+8V7eIgWn+x2cIj3aOp06k9VrgbXmDMwA490wIPt5DuAs8
         clZEOc4uV5uDQldH+CvqGqU5JI3HKoqTkTu2kdZMRzkl9XlimvHlWc13wpjnE479XL9J
         ei9eHGxDbJ6sHw9h6SiGCMlqHHTkjiXmPbEqV7351ft1PHAAAgzxfoVSYmacJI4gOL0U
         UPPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249462; x=1781854262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=L58aOBc1t+GGEQcW9ZUCClwQvWRVSfh0l0dwUX8RnHUPdAiHfoAgoY/hLcJF5PqmDz
         wD8Dm+3RibTWmuGetriZAkwjyoP2m+Q4jWl7sqx5+R0KFi0niCRZuAdEfb7uJHjaLBIs
         buBnyvjXmSXIzid5o7u60MGJ5+6TJrjvLQfTIaiUjxT7msImLvAEluy5rwmU3flVIOmT
         6gWjbSPp4E9eYP8MuxGF+1HB8FU2Rwrdd5LhA+49UXBs0si3uKubqA6+S+ONUEfSN359
         OEJcXHBCDuoFF8wcGR8XNKobiWWA3Bo0w18RacL+2ijuRLf/mOQ6KqaZNYaAj0u6AMh5
         5/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249462; x=1781854262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=HtCHrnqLDr+yelEa47gD6/BqLQ+L99xIkrdW5wgKdrsPSmg/xZY3G3/mcRWHdeSV1U
         HrxUZ2kGopIuDKJT1VFEZ+gEGhZqb/KWiwz1SNdkkwesEg8UtyL+LDNWDzURiQr9r6je
         yyBW+eEAWl0o28J7FS2UTWwaVzQQI1/lZr0BnjENXKiPz5Z+3s20eXuK/vMt0xczqQr9
         /fuunmUfiCGuoayLD94CDMj6yRKGGtvHZV2jTvaKjsXbz66jY51++68fGoKwrywQoxEQ
         NuBD5CNIjesNQar4PXGUtEt9gPbB9u0QiMCYl2apqfsxppNcqEs+xtCpJH4o4QGz2pXx
         GGnw==
X-Forwarded-Encrypted: i=1; AFNElJ8Xhxb1iWQoS/W9TLsHcQh1ULrT3D9aLXz+B8RiBE9W9nGXutVJcba0hxhKHbDxn1LmBBk69wGhI4IPRso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxa8jPqDxHrSR6P/bDW9Xh867Pd+FTZ8WIr1kBz4LXuMH8H+SP
	PF6m2GkRZOuGDNyBWzrVcHlU4zmGIUPZOFQg0Cf2FDlgic0d793ONY1fC0TXROL7o+r31Hhfsnx
	Ozy8ocsGk5Sk3TttPdFcAUhfFCxMcT+SbkNdOcQzn
X-Gm-Gg: Acq92OGCG31tjPD0LR7NzaIh5jsaPiZ6m/LNumH72cXw/xgUpSKRoPC/Fn5Zv1ShE1f
	FNQvndBqMINkWE0P2Z+LlumRjrxWZdaSt6frSHjjT8j+Leq6/W1erv0WbqmG2V58s9xEHdc7cdw
	eT5IUENTleySOfWYl5DrtY+RmPLTq9NuMKHFMJjS9p5YaIN54S11CU2En7zJ/W/UCu9ECVSK9YF
	lNdAAfeMUP4/LeNaL/dRXm3E8+e0BniKVyEMh+KDBO0mhWlid9FhUq+r9G2x80k+CkujvHc2TeD
	pvaIFlkR6Ne2dvaRkZJt9dcWH8S+wzKB5MGNsg==
X-Received: by 2002:a05:6402:360e:b0:691:ad29:ea33 with SMTP id
 4fb4d7f45d1cf-693779d1edfmr692502a12.12.1781249461160; Fri, 12 Jun 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:30:22 +0200
X-Gm-Features: AVVi8CevQ1ha7IS1m5wrojNeqF7AokFDz6V9vLKSYwmszS5cFjeqHBoSGHAAq9c
Message-ID: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in kcov_df_write
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
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
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ll
 vm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13723-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
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
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[est.tech:email,infradead.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D2B16773C4

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
> copy_from_kernel_nofault() or other called functions are instrumented
> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
> can be reordered relative to the function body, making the protection
> ineffective under optimization.
>
> Add barrier() after setting the guard and before clearing it, ensuring
> the compiler does not move instrumented operations outside the guarded
> region.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 2 ++

Please merge this patch into the one introducing kcov_dataflow.c


>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index df7e8bf70bfa..5248293280d5 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c
> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *=
ptr,
>         if (t->kcov_df_seq & (1U << 31))
>                 return;
>         t->kcov_df_seq |=3D (1U << 31);
> +       barrier();

Please make sure barriers have comments explaining which barriers they
pair with (see kernel/kcov.c)

