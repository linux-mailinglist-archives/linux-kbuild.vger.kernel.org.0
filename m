Return-Path: <linux-kbuild+bounces-12224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJKDK0qqwmkyggQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12224-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 16:14:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98086317CB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 16:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BD6F3094E80
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 15:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AF9405ACB;
	Tue, 24 Mar 2026 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhE2htIX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AD405AB9
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364874; cv=pass; b=S+pXRYdSd/50/wjk8MzkpmvjDqBLTNmvav5R+FjXE010VHrQM78PREbA858evjnaBPoHsrZUUjyO/3peOjVNRM5lN2gddDX09RoMrexVR8ZpZGOa194Zpq9TRmb9v/n8XYCoZKmuzv1+8MUTyKldxfoQSxMb7hQP0wl/O1irfIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364874; c=relaxed/simple;
	bh=1Z6JMNCHSGaxtIAix0aAtaZagu/pLyzUz7fEOf63FQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAETc51iRsAFet2AcXJMes2YcoXNEVPMvYimBQMfkhkFScf1TnJg85MpOhO7CNFldaAzPo4JvQphzu1fexbqKnDLpuFPEBwvxklWp8Q7t09MmVlgArRAaZrjNKbcjvuK2Y5L6lBr4TNLdYqsMdIh5sX8/0abNDIL8iSESho4m5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhE2htIX; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4870206f73bso23372135e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 08:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364871; cv=none;
        d=google.com; s=arc-20240605;
        b=RLxJuWGemBxp5SBbwFUWYc5X+XpBQz9XA1U72yaJPnzVs5hW0YUC7fJ1XIpv3kZJkx
         wWitFluOm5CCU/WoUU2+TRD6eW/OAHfye9hq3deEKFcYNGto4t27/oByHcwClONf5bY0
         0y2+tVXigbnQ/H0OIwsOs59ctyOMP+6MIu3rJYsYEYnGFn2AjrEuWxlmS71i8ajdg8f8
         4rlgUqQPOLmlgaRhZ70rM353rsVGgWKjukFNIBPB9bdjcxMALlh5CZePh5XHDIjPHJro
         mgGne0t34ZXV/5VoVY4QvF/ihWLwdnr/jnPTz1k/g0syVLxt12Juzddeqe/G6H3qLrGv
         LiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BskBfui7rapELmoLhcbRuH9sFyg4/N10zalNMto/sCg=;
        fh=lVr8M/kueZ59KgsjCeTutiS0IXB4R9Jjw03dLx6gFFM=;
        b=CwIm9BpeQMCLjHrZti0aIEKhJo5h/v1whp677b1A9BXv1vNbMyei5r4SZRvdcYkx7j
         N0ADHfHYDEuHAp2XF0qYg6GXljlYD+LS+Iw4I1b9ihk+/qBHfGzgq0tHcMv1WawUF+iM
         ahW6/RbtqDj8CBb2bQgmBvD2nxIRssRm+gk5yvN/ngI+2mHRWIX6tMl59s1fNrHCG/ZU
         WiClCmb0w5P9/ney/o0b26scCpZ7WqPacJPnG6ahqsT/7f7CQkB5GnfFlGd1XkA8jfhW
         Fyg125MtxDal5O0aTKJqmMgx/7I6L9/Z8KsD+ur41EuROxAVtvtS4p/ivX28b1oyrb9j
         kfEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774364871; x=1774969671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BskBfui7rapELmoLhcbRuH9sFyg4/N10zalNMto/sCg=;
        b=PhE2htIXEQo5bYFb7KluljetQMoLlA9n2RRoXwzblUDzswJ8bFRC6AM5DRa+GExEBN
         FZGpT0eVO+zwKmDBhjlBIH5iZc6Jbb4aGj+Rm40RMZ5qOlrDF+nEJ4+hkxlUhCT2xYZG
         67EJ4PzVn1dA/LNeZr73nxAkCCp4C1SiD5w29nFBlv8bZI2ZGHEUdjGdZzygTOR4Prpx
         09ESScw+O9kLOAdlDMApNQWbRFOXjzOBQQteLYK3DMmvaN1vEh7qejhC1P1QvjIGg8bf
         LO4zH2XZV/QtPOEBc0k+CTr3Te3THej35F3tYmzoP0O5O+sQbP9ywiMg+bCB8bJ4kEvi
         tpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364871; x=1774969671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BskBfui7rapELmoLhcbRuH9sFyg4/N10zalNMto/sCg=;
        b=n4lPwo8rQv3jes+N21gKxRL+fBY6PzWcj3PxLKbiiPf7kcMaPgQ7eQTdggo9p8syyW
         2eF+0teHAnVx+XzpULmT4UrLRKEL5ldwtGXtC3BCZgLumYPABoIJPeMH9PYtvg5k/yUx
         EsxuFmmoVDFYAxnEKlCMlvTQWgHTijYLVL1mHzVi10dryIyCF0LmkQRaCje27S9tssfL
         oOwLyOeh6/bBcJ+c2Hy0SMg0NOzxa1xb6//ozLBQSuuugdv1VZrzHLWFt+DBLYhD20wJ
         l8P17SO0fhM4pwVU1YkK7/CERGVS/kTjpeOUjZ9pPXez9mt1lhulgZlqQtK9vccl7EzG
         yZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXTnQWczmyttIAzgqkSmo5il4cPZyFLS+Jdwp0K72aplITJDdInwabjlJlKekDFsIcayALVx7n1lZN1r6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cLr3rjvMIeYf3tXYZqphZnhomEvgQQRYku25XUFBVr0QYY+s
	PYSIAkFqhV0s5CTsOcQLIgqdVzuAxVBV+sXIIJ2Zvs+GYk8SKprTc5aiYNHjQJm9ua9pCB40SgL
	NfyuSfFwuMoRG7dua2KT3JzWaKgsIpIw=
X-Gm-Gg: ATEYQzwoj1aVsG4i3FmHN3li0z9hSTTNlSIza5+I17JGb7sGF2j/AhR9D40S8KZNsoN
	tqcSdo6Lm2qO/8znVlpeDEFoMG118iYAqYv0nOKi/Z7xWEMGiQKbsrPYYgIf/KmbxhOe7UOttsT
	areeokhGXn9Jl7UOEoQzMtZJ0T7K/b0QbSoDDnjbkJ7sw0Kzg53ekPKdyJp1oJAYgVDL7XW1+IR
	5pHt3xp5/NzvzLUlupGVJJDjtclRsPCh+39DanNQabXHjzVZ7foDYvZEt3Ris2oR5q2WEu87sbp
	BWteCyt11RoHp3kKdzWKogc/tKRAWKcLjsuoWT//x6oW1pdclSyR+2gE4lGrHNEhANS0t/crLWp
	hPDpzsnATbS9RGUnqLCR4SVaWGw==
X-Received: by 2002:a05:600c:8489:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-48715fc384dmr1835815e9.4.1774364871041; Tue, 24 Mar 2026
 08:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164858.1939248-1-sashal@kernel.org> <20260323164858.1939248-3-sashal@kernel.org>
In-Reply-To: <20260323164858.1939248-3-sashal@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:07:39 -0700
X-Gm-Features: AQROBzBqtCVnV-aokcS_jfx2Rq64gl7691VsnwgJMvcALBoTl8K4Z3ivzRJzHjM
Message-ID: <CAADnVQ+oBm7Gj3KScFujGwVKc5d2sqcK3MWX5K6dTAjekYitSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kallsyms: add BTF-based deep parameter rendering in
 oops dumps
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Alexei Starovoitov <ast@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Gow <davidgow@google.com>, Kees Cook <kees@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Juergen Gross <jgross@suse.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-modules@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12224-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,hansenpartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 98086317CB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> +static const char *extract_struct_name(const char *type_str, bool *is_un=
ion,
> +                                      char *name_buf, size_t bufsz)
> +{
> +       const char *p, *end;
> +
> +       *is_union =3D false;
> +
> +       /* Must end with " *" to be a pointer */
> +       end =3D type_str + strlen(type_str);
> +       if (end - type_str < 3 || end[-1] !=3D '*' || end[-2] !=3D ' ')
> +               return NULL;
> +
> +       if (!strncmp(type_str, "struct ", 7)) {
> +               p =3D type_str + 7;
> +       } else if (!strncmp(type_str, "union ", 6)) {
> +               p =3D type_str + 6;
> +               *is_union =3D true;
> +       } else {
> +               return NULL;
> +       }
> +
> +       /* Copy name up to the " *" */
> +       {
> +               size_t len =3D (end - 2) - p;
> +
> +               if (len =3D=3D 0 || len >=3D bufsz)
> +                       return NULL;
> +               memcpy(name_buf, p, len);
> +               name_buf[len] =3D '\0';
> +       }
> +
> +       return name_buf;


Nack. This is just awful.
You didn't even bother to reformat what claude spat out.
Which means you didn't think it through.
It prints something that looks plausible
which is the opposite of what kernel crash dump should be.
crash output should be accurate and not a guess work.

