Return-Path: <linux-kbuild+bounces-10751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP9ENEPMb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10751-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:41:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20849A10
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4744B5ED352
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9003344DB9B;
	Tue, 20 Jan 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YHFiYZ9S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE744D6BD
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932776; cv=pass; b=JnR0hELQCNqDt6bH9Dbod05P6RHo6QPDyTXCUgLKveMaSTYGmlY7d8I0mJglqFw0tRlzJlvVd9AXym/8ZhdtbpDrJ1W7Xt1p7QR5W/ALcrQP/f/hVcestmGG3LiRLeM4TW3vm5vAuWE2Nd07Gz7kYUH+QzpNQcFfKNncoMytUxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932776; c=relaxed/simple;
	bh=G0ot6VfCtfTdK2d9u7Kku4JHYhx/Ooh4GfeogKVkVAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jf6Tf1zCCWIGoWGAgctS/AxU9lUcMni/8zYd5RO/XGLf0D8vy95FmE7c6hNjsktBn+Axi9xEhKGePF4fLLH5NobIV+0DbS/K58vexADr4nSJITa+4Qrjfc90R5Sd5nyTZ4MxJ0z5JKvfGeVkUvN94BTMzR6dzSx1h2obBWNUDB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YHFiYZ9S; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b87693c981fso945890066b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 10:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768932772; cv=none;
        d=google.com; s=arc-20240605;
        b=EEaqo9mzsjL9f0xujuO+f4gwsA7ssj7NIWDwEzpt6zYcsdE+9Rwf44ZhYdFAWNLPDZ
         XwwYMdnmedBUTX+5vRjvRhcbBXtLT3eeMzWqXQYpBgLUKXamm9fB4EV+JTo7zZkt6mRn
         gFK1k849IIEwtvc0X/7xCnAsitohc3YewClNO2BuD6+2gqkkW7gUzRKTv2GHacbWqEdF
         O05G6vTsTEP5YRXtEWFgUN1dB9JdDJm7UIzAW542hTMhpJ/1F6+d98gi+j18t11oAloz
         BD5ulZ+t8DcABx+uUR/zOZtypNBOCVg5UUM5clApwJiv4umdO05L2S1TjMnU/jjcAk4C
         du1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e8YNtzr6sL6sTnKQNamIDqVuGsbXWJqsHdWC+WyrhKw=;
        fh=WhdI5rqHQYdWY3wqxb0Rbym2dypC4gJ9wPnb1Hyb7aM=;
        b=eLrsjT1yjHGx4Z2h+b7UGTUlnTUKiQnnzcBUbgAUeop/yJ+l6qTIO5lzgOAmLNmU1D
         le6FX/d3bneTYdqMP0TJvESDl1YaLmMnJym8kpNxWO7714oYPgZAV7qDYWyw9GDt3OGU
         qH/3bXM3PiKIgQrxeJCex9VEpmGgNZaOTTKEjfSaennyFFk24v0xerqqaE/vHTmWYadg
         Xt9/5s4R4IN9h5bWqJXBn9NJQLWFWiKQprGiJJQFJHh5a59YA3G3T7vVe1O8GDzHf/07
         JmX6g1K7nvgyiZLkjzfSpE20l59c3HCxjzjCixwvAmXCZLbils7UAYm9DbCSD9VNQ+NR
         dUkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768932772; x=1769537572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8YNtzr6sL6sTnKQNamIDqVuGsbXWJqsHdWC+WyrhKw=;
        b=YHFiYZ9ScdC2spexyQ2ESNoLvRezy+51Hdh5z9cS39+2HCnseJGRUbUc81mLPstnts
         8q6lNw8uAOtXj8ifDZbXKimnZioZpFP2Sc4OMqtDlCH4AuXsSg/KOwCh0E1tm02K9ZwV
         RyQqCSlEcJUaM6LSWZQNIVxX2eUpaKmXpCLFj07FzL3tOoRWaJHh7DRqp+84ZPlzBaXx
         pRZN6XyYMmgBR4ZYw7Xzm9XVCMqSKvPYBiv5cxAqnyqMKKSwMsFkRBhK+lbbiZDKMeZG
         EzsCym8802RPHgvflW+8KP0L/uBC9a+tl1IuQbth+AyC6Bs6uqsQBaRgEY1ABAnFJbd9
         3guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932772; x=1769537572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e8YNtzr6sL6sTnKQNamIDqVuGsbXWJqsHdWC+WyrhKw=;
        b=foem1BVKzyYe9Z0kkhcewjh4sFdt9960y9ccePCLim/sqIo3dxjb3tJX8PQN03PEBX
         YkvX5CdvQQN8GVsP4AgSHoWaUJBHFJw84KjUsxuF2wqM5HpcxnU0WgoB3xdFa9YwlMwc
         wlf/7368IFU/h84+tVz341kjFX6YfMbnDcZsNeunWB1vF/ondv+IT19WZvj+rjEhZaMI
         cK2pgixqKsSFvF84ioe1fLQVxAcbvCmb+UMd901voL4kRTSngwmdgJdqWE6xt80DT9Lj
         IKUrey/8fqwF77yRwtviGGsF5eQ797164cFgkiwE8px5PNR89u587LKmC1+PbGYHXmtB
         114w==
X-Forwarded-Encrypted: i=1; AJvYcCXzeVv3jp0CrUoubS3cDClWRHylMkMqD+8PQhmaI94qREwInVf4P3x7njMR8DjCuB3kvlVtXupNzTivUys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY7yv/4rTM4BWf6buqY8c3z8TbSHLSU4e2YKAqBQRYdfqaYhFz
	WEdLXhUbeyKRdxH/gMcUb/lJW53BzGb5c16eMO7V4t/KFaUnIjuPrXl+XyM+vVSyi+ttBbOgMnH
	9Wa2O1iUNYm3KF/yS1xfsfuwbGmDJ9L0wms59wLM=
X-Gm-Gg: AY/fxX5VjtlCi5cHNwNnOYjpFqknuK0SAiDn/qLuqwOkeNLJXKYEh2rQt+CwQ8799Mn
	+18Sg1vtNhCa4JFPAdgPHJks+OVcWB7XOCnPXITXegz4WaApFHj6icSAWOmiYpiza0fS0OxBw/s
	eBisQqjRCBGwkLftUB+t+aBtpUFXiHNVfDTTNfpGuCaorEXDi2M8DPqmJSiF+xE/ChD+AjYd+ab
	R5tvTaHe9A3jejn/452FyQaUZjtUWIbh8ZU5kcrJUvs6iq81MysyO237HX70QVi9TLktFGo5DW9
	u6EcX8nhBKFB6mwz9We6GCN4qvep/h+SbzMkhokYhWGnkBVQQ7fWIzKmk3H4bvJwJRLfrNY/Jt2
	5SBA=
X-Received: by 2002:a17:907:9615:b0:b80:5ae7:5d94 with SMTP id
 a640c23a62f3a-b8792d27519mr1273652266b.7.1768932771343; Tue, 20 Jan 2026
 10:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114193716.1740684-1-morbo@google.com> <20260116005838.2419118-1-morbo@google.com>
 <20260116095318.46a149fb@pumpkin> <202601171106.90E508A9D4@keescook>
In-Reply-To: <202601171106.90E508A9D4@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 20 Jan 2026 10:12:34 -0800
X-Gm-Features: AZwV_QhDwTff35V7oRC_lRCHIRr3OUHATuj7NTOuUgdO0F2oWVoaStpeXxTPVes
Message-ID: <CAGG=3QWeYZqLA8FSMYZFRrJ24LtEKJdmRAq3awkMZj0+qy=4_w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Kees Cook <kees@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10751-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,infradead.org,linux-foundation.org,linux.ibm.com,linux.intel.com,chromium.org,suse.com,linux.dev,linutronix.de,vger.kernel.org,lists.linux.dev,goodmis.org,zx2c4.com,zytor.com,linux.microsoft.com,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morbo@google.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9E20849A10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Jan 17, 2026 at 11:07=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Jan 16, 2026 at 09:53:18AM +0000, David Laight wrote:
> > On Fri, 16 Jan 2026 00:57:57 +0000
> > Bill Wendling <morbo@google.com> wrote:
> >
> > > Introduce __counted_by_ptr(), which works like __counted_by(), but fo=
r
> > > pointer struct members.
> > >
> > > struct foo {
> > >     int a, b, c;
> > >     char *buffer __counted_by_ptr(bytes);
> > >     short nr_bars;
> > >     struct bar *bars __counted_by_ptr(nr_bars);
> > >     size_t bytes;
> > > };
> > >
> > > Because "counted_by" can only be applied to pointer members in very
> > > recent compiler versions, its application ends up needing to be disti=
nct
> > > from flexibe array "counted_by" annotations, hence a separate macro.
> > ...
> > > diff --git a/Makefile b/Makefile
> > > index 9d38125263fb..6b029f694bc2 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -952,6 +952,12 @@ KBUILD_CFLAGS  +=3D $(CC_AUTO_VAR_INIT_ZERO_ENAB=
LER)
> > >  endif
> > >  endif
> > >
> > > +ifdef CONFIG_CC_IS_CLANG
> > > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > > +KBUILD_CFLAGS      +=3D -fexperimental-late-parse-attributes
> > > +endif
> > > +endif
> >
> > Will that still be needed for clang 22?
>
> AFAIK, yes. AIUI, this flag will remain while -fbounds-safety continues
> to be upstreamed into LLVM.
>
> > Looks a bit like a temporary flag to avoid regressions.
> > Probably ought to at least have a comment that it won't be needed
> > by some future clang version so that it gets tidied up.
>
> Once it's no longer needed, yes, I will want it removed from the
> Makefile.
>
Would it be good to 'fixup' a comment in the Makefile for that?

-bw

