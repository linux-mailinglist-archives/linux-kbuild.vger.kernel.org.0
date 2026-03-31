Return-Path: <linux-kbuild+bounces-12455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJWdKC1CzGm+RgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12455-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:52:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70937235D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8C353026A9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAD34657CC;
	Tue, 31 Mar 2026 21:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULwZTnZw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE7451076
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993854; cv=pass; b=aSSp/Jkuce0R2IqOb11oAfaXBPjPTYiTj8YVWWWfW8dzYUtKPThvKKyE48FBQb5MlQeLaCtDbtSt/t1HFm5zpCQrTNkNKhhjch2nG5caHKkaJLw9oNaY5E07BHhquaNlvBjPSoHcOu/rpC7Sg6nBmvZYAA6uVX3bkxt5eMuTv88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993854; c=relaxed/simple;
	bh=wV2XHf4d1mRiH6xWNqUuoF9pM1xd5tcDK3VA/1dQDZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUJsg19P7u1nXqXxJKfxCHrdXB6v5BeC7qr4MecJ0n9a4fwpcXvPGs/Xo4sdK4CIeXcJgEX9mY0+1wXdgjcawS+Imci+hrtMQ8sWe9GtHXYKWZxcisPM1/GJzNvocsOG1z5ZRfs+KxDcw695n8yr/al18mMG1shnv+vnUHumTyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ULwZTnZw; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so1888525241.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 14:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774993852; cv=none;
        d=google.com; s=arc-20240605;
        b=gltWKJ356zkdSUuUhSD0IN1wV36o3DMeZGIr+YF/f8wUpFwobcGDUjT/WmKUax0ZU5
         2g58jrbRByqrZMh4e2vub/Jk5mA1O9Nyak+sDQ/czC7W3QpfRqu7QyboNzZkO3tTZ+6Y
         d8vIpw4VpO9KOZ5rMV/3ykUDCGSmr9ErjQxAGI1wzWJkomG7DI2SschA0YwIRAQRQj7j
         f4mzE+hzATkYhGQ1f4wyIRFY/Jcuo8/3rYlvzSM1zr7+vIw5Blq6hQAp1PO1yo+CS0NQ
         CBGKFhpKVHGEeOw96gi1tK7+PT4NRGnig2jtoWOBxzfVKEusiL7dMjhNTDKhlm1PyD9J
         Oh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        fh=qKWM8PzepwYgksnK8HS81zDYr6cjFe1sDHdcnWucMjU=;
        b=L/kXDmo4i9bnqS9qNUjRxD9cLRkSKMvrFxWgaNUh5yvBMse0U9rvJe2usouJrnZ8cT
         oXNttDPR5QJRGasIrbeHHCyIEpcVhl/Nm+CJPVtWS4FfctzWtAjZPRIwWOzuWuOLy2th
         rjVQdcTStyDv9nbW1XLOkpfb3hvygkwIQuOSklLgQBaM0hOPnyDKilO8v0Y5/pbih8HD
         EA/b213gJ6pOK9odPNy+0E7qlvQTcHI1vWbIwiYAVpr8sYNdrOJxJfy6DkbLk/EZNUWF
         oTXbBZ0DJCc62nA6Z6m3bh3rchh2OrlgQPL2gge6Z3tcNtNCZ4PB3C0KfxLS0pb1mbS9
         Qg/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774993852; x=1775598652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        b=ULwZTnZwYpEALX6nYfAZF+FT/TisjHVclbRPF18BSgBSej64+DQ91M+9Bw8kEootcv
         EKnB/kCkqPVag1udxVN1dXVt3PDmt4LlyctpUdpZ+bzfGwWhNXD+qpjSpHVGEx+udmZr
         kYVX5FPfL8GKwkLr9fkbk/kzF/HsXC4zkbqgGHIcxAACsr5r3Iqx7rWTGBG/8UjKtk2N
         9jTv0A6N8cCJSO0KuHhQq+Dg1fWk89vvnYBYn0Z61TOxGDqO7yLfnuHVTDg7/2zdzoLs
         cn6+piLytbtRb9XiHAUBz1RK14sB1/tWNHV+luKZRT7PuPzSG0jv0/dnYNDSef1+8aJD
         b+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993852; x=1775598652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        b=hCTKyYm6gUrHLaGrGuXqQB4M2Fglg0pX9EYmz339JlxKrvph8Syo54TMp/XLYFbsJJ
         9ZTVN8p7rM+nvMUX8gFTewgz8IESFXrzPT6x79AptuERB9ih8lGMKO+hmlD6Sm9tUXgB
         UsFTQsN613qpVIrNHs+inZm+OcDal3lhnt9tyJX7FfK3ytarqbHZq/lacLc+nbkqfJNN
         kjGLdTqEFaWj987a14vfHLxsJAQp+56Cp8NgH2azUd5QlYD34u+XjZdFn28mUp1SylC8
         MelnZeQ/g3bVoB75WVUBe/MATpANjWnxGRgWmI17budzvM1q7/mmta9oFLVvPO9Z3FQo
         nSVw==
X-Forwarded-Encrypted: i=1; AJvYcCWfmywYlXOINZL5obl5U5Va1n7cyJbqhUOD28XUdLUmxEDTzr/e20x54UYurv9xkghVGAxuaUwJJxC4Foo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3n8pfH0qVmHichXkooAoxFZGcjBhsvUdL04X1A+8z3YKmx5c
	bcpKC7sp9MotVtli2EackiJhde/WK53/sSyEZvuZ3wNhZWdWWtXkMhwQD9rvUsyTjvNllPF8dza
	yP1FlFBF3qYue2o4ijm+f+ehA3um2v0uP06Won/UZ
X-Gm-Gg: ATEYQzztWQnQgEdRsC0o8XlWajfyzIk2QWGBiyRBl6iD56JjarQR7K+U7MQc3gRHLqe
	rwLef7oVY90PmCkyX00J1HpnjT/8/fcy1gcmGvr6M/Uq3kZjCvV0v9ErmApNd2nN9Qz4jQ3Sgyx
	K7ZgIF0opwdwVyQKFBn53SuODcQudPMncTkuh6LbyZLzbUGHgTXz5KcBZVvugJjzK50UiOJXH4L
	IvTlHDukSPrbl8Q1wtjhsGNEkIaEGAUirUFGyrNlkklG4s1p/gUxs98HfkWJ7SzszVYNIYg8Us9
	GpuC9E8=
X-Received: by 2002:a05:6102:2920:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-60567fb080emr381935137.22.1774993851331; Tue, 31 Mar 2026
 14:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
In-Reply-To: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 14:50:39 -0700
X-Gm-Features: AQROBzCZD3X4CkUD9sEd-qirDA1mrMa-OH7YNrOM0p4tLkqwVMQeCLGoKwyIRLE
Message-ID: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12455-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: 4D70937235D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Mar 31, 2026 at 2:05=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
> >
> > (Isn't this just an implicit "try"?)
>
> Yes. And I think that's ok.
>
> I think try/catch is broken for a few reasons, but the fact that catch
> and try are tied together so closely is the main one. You can't "try"
> inside a scope without having the "catch" inside the same scope.
>
> So then the solution is to just move the try to the outermost layer,
> and I think that's pretty much what everybody does.
>
> But at that point, why not just move it *all* the way out, and make it
> implicit and invisible?

How do we feel about type-defined labels? We can specify sane default
handlers where we define the types:

        typedef int __attribute__((overflow_behavior(trap, __handle_me)));

... and define specialized handlers later on

int func()
{
        ...
        u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product =3D 5=
;
        ...
        product =3D a * b; // if store is truncated, goto __overflow
        ...
        return product;

__BOOOOM:
        pr_info("%u\n", product); // shows "5"
        return -1;
}

We would then probably want a kernel shorthand to avoid long type definitio=
ns.

        #define __TRAP(handler) __attribute__((overflow_behavior(trap,
handler)))


At least this way the label is always defined somewhere in-source
rather than by a magic -fhandle-my-overflow-at=3D__overflow


>
> Which is kind of exactly what your suggestion is all about, and that's
> why I like it so much.
>
> It *literally* fixes try/catch. It makes the only really valid usage
> model just work better.
>
> (There are other reasons I dislike try/catch too, the whole
> "exceptions across function boundaries" being another one that your
> model avoids).
>
>                 Linus

Justin

