Return-Path: <linux-kbuild+bounces-13769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1QR6JmaYMWoCnwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13769-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:39:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB46944E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:39:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MaSJ4b+G;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13769-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13769-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C350D31FA33E
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 18:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FDE3DC4D9;
	Tue, 16 Jun 2026 18:33:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7EB3D8902
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:33:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634832; cv=pass; b=ddi0384vHeg5wlBR7M4+OGxqyXUjF7Jb7V2r3hzztpZgClwk5EL38JvSTQQOzAxZpjysKYfMglSIqB5m2Iht+Ev+Y5IRUka71weWAVeyTM8Vy/BPbME//QFgNvS9SykU0tlbcFolsr3HoL15cCei+mp2QK6XBvHJga5hMtKImF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634832; c=relaxed/simple;
	bh=sOhlqxN1qxKBwhvm+ri4qwEDLQ9bJn8qASOPOcgsuPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9ozDIVT1FxB+jc29PJ1gicAwJ6/7uj/kMBE7dvCXrlGSlGUzYEg/QO7G2/NPbgr5d4eNR40EjqAzeu3EeezJA1qhto9DUomnDzymABY4rtUkdj8PeYF3pIvyaAijFhJd51Ri82bwG4E8VI2qDLIFocUUqvV6sts1+18uVZTK4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaSJ4b+G; arc=pass smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so3103692a91.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 11:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781634830; cv=none;
        d=google.com; s=arc-20240605;
        b=copsDa2BrbzCKqjYS1XqqU1gf40t85nDIfyypYj/sG3tsKbA6a7kvDASyGiqvx+Gz2
         0MdpqFLKGRmbZuyTIcsdcoC8E2dQ3GxfnuLmw3ZgmnByG2ioYYZTxEjsJiKf4APgamj1
         D1hvs131V3e/jygqxqCEI3/EzyqKYKrETvnVS9yc0XzBleW+RVxZZKvfEySs3Atsq2pS
         nLVEHDlCruZm6210TZwJFRxM+I3c+Gm2BK9rPw33QHEBxMw0OibGd62PYYBYXGzdtGeo
         L29yzZ8Q0O8Lr5o4vGXBly8HFEoLj+Jp0P7J6jOfWAp+WMdVzjIRgwot7rNa1C4p4fRX
         oEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z2GD8QHUKY/U9GJPMUu0PNTy3ueaGFFkhZ/ZmWvkLEU=;
        fh=y5WTjYyYJPOdSwJazevqfPauL2wxy560kN7WmdLOw/8=;
        b=f7PH5p4g9cbSXBbRjd0mcdB65jch2J0nxCKxKU9EnO6RW8bu9fmaAI5gwVaWmd2zS/
         uJX8wSYbzlT+xYvuQDVIDZubkgl1jZ3i6GfLebVCDAUD3/pKGU0ytAv325AoIuW4zOj4
         XI55K3AdPBt37yGupg8Zq23wmYo0LYOKXYu55fMxu2y2/Nzkxp06VQxo4J6WaWQt5o8Z
         TO9ZTTAoysTNudxsXMX2S0wbal4zUuXiir+vrcdyx3H8iyFYveOQxVJBZLa49bXyfFIn
         YB2GtY0DyHhusi2f1q4qTIIGSSoUdJtcXE+Qy5ePeE3QSTVZFkRs/mR3+LulIw0zsE9B
         CGCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781634830; x=1782239630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2GD8QHUKY/U9GJPMUu0PNTy3ueaGFFkhZ/ZmWvkLEU=;
        b=MaSJ4b+GpHCOQGqvy7YaWVhtMTHbCT/bEDKnu0pfaJqD4lxKIKA+p7nAcUlHG6bK+T
         J5V6lGhyeA32y/8MzT5MPoz3yd3vKIUimYV4jz9ajYG6vTb4s1dEdCuiXdH1TOXtp0QQ
         ubiHx+WWbWxfIsm9wa5mh0rFsQlRDadW+DsNrHKMTfJ/k3aZjYQvAyjw86ccF/bj3qCf
         mLVSB4xNffxFPYxl1B4pFoS+1ZVDhxN5bE3P016rTVrsXoIi7bx9YO++8dU8ODcWlPtD
         VqPwKsm0nA73jFGaAl14Y+96vYJMb4fpW/fuFMJxrIwXPEWZmAAQ3P3LfpwE6cAwErB7
         tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781634830; x=1782239630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2GD8QHUKY/U9GJPMUu0PNTy3ueaGFFkhZ/ZmWvkLEU=;
        b=DqjZX0DZsp8OMM87+iL+oXBLuuvbh2QYA4Du2g5gY8m3JRHJequC54y/Y1QVlUkAoa
         OQZJCD6v7Dfa1lFTEEuvcHN2qMZaucjt7G8F0JFvaAflvK0Nbp/fzr88ISMtAtr1tSHN
         +d5bPy1NU1GFM8f8otBgTFNxxpLD7Fm42z3jIR1pNw1EJerCLxwbRJ8Q97fIa4ljch7S
         1l/SKyZLY8bXXiMxuzGzOr253qk9mlBUGLDwMFJA1pzl2F7YlaptRH1NNPmlCS7W/HKs
         hPbhfA+/JPS4JU58RSUJxITWdJUs2kWFbiB2cd7Qwc1tqxCCDSINFkL5aoQe0fVGc/6V
         7ejg==
X-Forwarded-Encrypted: i=1; AFNElJ8bukFTojtQKkI5Xjxqu/9X4QyByTGdsZ+9P+Z7D4e5i5z7YLOlBpd42yTiIg4sJt7m5ekvqIBej/Y8pT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz45HtfbTyidHZ60oe7PlaBJynIXNj/eKyOKLwmgAKQb7Qa8T1
	U8i5shQgXiNXmQwxPE/dwZrEjz5D8PruJi6Qq6PRqBAuRdhXderbAMga2Kezn1+3runu08Qq/ch
	QopnG2ruLwjGIbtzeFsuVz0J2i6SuhR0=
X-Gm-Gg: Acq92OF1UYh2FEyc26JoR9NTRdSgVnGiXB7zDFeSAoX1161ByyuzT8YwhicUApPtgpW
	QtH9c75Rdaw6GY0iRtgVu3n1V3QEYZkXi1Lt79HnoohQHDwSO+f7Ujl8e5/HQnJQSvGCckfAQd/
	DuQqEC9SKPe8Kdv0hAAwEgIbkzXXbuofmC3R4+heA4s4Kpzmwk8r3KDtaNPO9c++8iXx1d3OcPd
	QPo8t66m1mNgk8EgRm1MELURLOYp0OqYcwqyqh3+eRhOqSBqs1ozQPSQIHhANTeSjHMZdpSk8zz
	Mf32TpiEPOOjpmPhtCoAf8tMsz3ZcFErqbtSzSedM/ZCsf73BFbt5v38Qu4875YrCPB/8vYS8un
	s
X-Received: by 2002:a17:90b:3849:b0:36b:bbee:fb28 with SMTP id
 98e67ed59e1d1-37c92eaa16fmr646672a91.2.1781634830501; Tue, 16 Jun 2026
 11:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-5-ihor.solodrai@linux.dev> <DJAA8M3U5PJ7.W84BYRNJA7UY@etsalapatis.com>
In-Reply-To: <DJAA8M3U5PJ7.W84BYRNJA7UY@etsalapatis.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 16 Jun 2026 11:33:39 -0700
X-Gm-Features: AVVi8CccuGGJNiwf-tGInm6V6RfMkfsCHF2OFCLNtmu8oCH_6xSRE0ygqN0a8qA
Message-ID: <CAADnVQLLcDPnt5q3MdYjHC1zCJuBPrbRYgoY__5Gk=GKoBvWAg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 04/14] selftests/bpf: Add kfunc set test to resolve_btfids
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-13769-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:emil@etsalapatis.com,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etsalapatis.com:email,vger.kernel.org:from_smtp,linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECEB46944E1

On Tue, Jun 16, 2026 at 12:07=E2=80=AFAM Emil Tsalapatis <emil@etsalapatis.=
com> wrote:
>
> On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
> > Extend the resolve_btfids selftest to cover kfunc sets defined with
> > BTF_KFUNCS_START/BTF_KFUNCS_END.
> >
> > The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
> > resolves function IDs, and checks the kfunc set is sorted.
> >
> > Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
>
> One nit below.
>
> > ---
> >  .../selftests/bpf/prog_tests/resolve_btfids.c | 56 +++++++++++++++++++
> >  tools/testing/selftests/bpf/progs/btf_data.c  | 10 ++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/=
tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> > index d0e51979d455..f6fd79b9dd23 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> > @@ -10,6 +10,10 @@
> >  #include <linux/btf_ids.h>
> >  #include "test_progs.h"
> >
> > +#ifndef KF_FASTCALL
> > +#define KF_FASTCALL (1 << 12)
> > +#endif
> > +
> >  struct symbol {
> >       const char      *name;
> >       int              type;
> > @@ -26,6 +30,17 @@ struct symbol test_symbols[] =3D {
> >       { "func",    BTF_KIND_FUNC,    -1 },
> >  };
> >
> > +struct kfunc_symbol {
> > +     const char      *name;
> > +     s32              id;
> > +     u32              flags;
> > +};
> > +
> > +static struct kfunc_symbol kfunc_symbols[] =3D {
> > +     { "kfunc_a", -1, 0 },
> > +     { "kfunc_b", -1, KF_FASTCALL },
> > +};
> > +
> >  /* Align the .BTF_ids section to 4 bytes */
> >  asm (
> >  ".pushsection " BTF_IDS_SECTION " ,\"a\"; \n"
> > @@ -77,7 +92,13 @@ BTF_ID(union,   U)
> >  BTF_ID(func,    func)
> >  BTF_SET_END(test_set)
> >
> > +BTF_KFUNCS_START(test_kfunc_set)
> > +BTF_ID_FLAGS(func, kfunc_a)
> > +BTF_ID_FLAGS(func, kfunc_b, KF_FASTCALL)
> > +BTF_KFUNCS_END(test_kfunc_set)
> > +
> >  #pragma GCC visibility pop
> > +
> >  static int
> >  __resolve_symbol(struct btf *btf, int type_id)
> >  {
> > @@ -108,6 +129,18 @@ __resolve_symbol(struct btf *btf, int type_id)
> >                       test_symbols[i].id =3D type_id;
> >       }
> >
> > +     if (BTF_INFO_KIND(type->info) =3D=3D BTF_KIND_FUNC) {
> > +             str =3D btf__name_by_offset(btf, type->name_off);
> > +             if (str) {
>
> This can be rewritten to collapse the nesting:
> if (BTF_INFO_KIND(type->info) !=3D BTF_KIND_FUNC)
>         return 0;
>
> str =3D btf__name_by_offset(btf, type->name_off);
> if (!str)
>         return 0;
>
> <the rest>

Thank you for this comment :)

Together we can fight claude habits :)

