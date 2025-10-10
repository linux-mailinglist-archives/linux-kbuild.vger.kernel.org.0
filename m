Return-Path: <linux-kbuild+bounces-9080-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774DBCE539
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 21:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22004260BF
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 19:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2059F34BA53;
	Fri, 10 Oct 2025 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c/dW9lIO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535421771C
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 19:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122969; cv=none; b=FlUUKYBClljwBvXfZ38Y3zVCIBS0NexQJE042CdrxxaEo4C3MwRDBqk925BQcaxGaDLANVJGQ6ZodGmb+xUZs3t25ttCvzxxWRFJrZpAYGDuTpob9rzSqPNAM9D/Hw1dGQ/Lqu7adK+/C7NgKT6utC9Ki5WbvS4NP7AEn3fRyTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122969; c=relaxed/simple;
	bh=ONGm+/fW5tWvXic+jldb8HPXfNQq4JzKLLhXOYU1d8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVmHEEYJZbkgpoLZ35qv2ioe2XEX/0fJLtoK4iD7s0YmII0ZUkkPCyedoRYTmZjlPyyw7ULCvfMLLBVGkwk9rhl3FqZ0Xl7aSCfCXgsM9naznj2BE/aYr1dWOBtxjkkJopKHtsSA5uLTvbZFK7Wi4WqW9MrgbLt9s8xZkeqQ+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c/dW9lIO; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-78ed682e9d3so22187226d6.0
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 12:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760122966; x=1760727766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l95sezWNH+Q9ncNOnvjdLwTjn0UUlfu+q2zDGxDlEZA=;
        b=c/dW9lIOnHw6iNkfh5F64azlQ6L0ZMjNgSznJaQI/FSyqRZ2tIr5p7VPpiSlPSOuen
         2a+DX3sANkPn+VnkO6hEiXRpJtyZeIkPioNCk2H8X4RsmJ8RyhR3+N71oNkebZRmV5+w
         Bh/DB/r8mAxQEk1GAe1MfNJzoZSmpVF44NwuhE17ijipeUc1uVdOIoIDoQIbsbyC7uZ4
         uDttXBTsy1EAMORDCJgASnB2PI05y1NaEs0CTeOBXFARQqVlDrCXJQrXE9GjOCD76FlU
         2V0zzKsKK0+IOooFbHLCIse4gSNtYDUc3QOTO7dFmR4hswjY2YoYluq7hYh8Fdt25s6W
         IXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760122966; x=1760727766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l95sezWNH+Q9ncNOnvjdLwTjn0UUlfu+q2zDGxDlEZA=;
        b=Z6vfW1/ve7HNbwy8OcW+wHm5IfCv/MNZyiKMalcf09k+4TsdByDNxzPkgKsOX8xS9P
         ptvvDb5630bbh7KNNHaZBSPr7sdSCgCraVJzmQ/Z0nYeBauFMaD+cdXF+SK4JN8T6+qV
         /NgDccqJ/y3Yqp6W2QUthd84ocsfgVv+CJll+3qCcmHaSX7WeJQuk6k6vlPxyemrsKIh
         wJaLZIwYvyhZNc6AZ/13PgW4gCi4r2rdnir09zJQUq9Cnb7/vLdy7iu3NEebgrl/+fvU
         Ry3X020unrpFuiwx13pjTfzFHQwlPuDB5XvQXuC5rilHQt5WuLFOY5YIv04qIwQqZocD
         F/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVwpUo2sh+J1lnJIldd0ErY4XBnOZQ9MYPO76edhq0b2YlWXJuHsD6wS2c7lRNTkO3StdMN1wBcjgYifUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4b38RX8q3lxCeixoVNYWgqEr74wWZfZQsAFd8ANe6BOthXr+F
	4sqsew2ONZC2vNxjSC5COXCSr/+8Kg9WGp5IsRDhjLTMQjeNC0ZguOwuL06EFii+gw+4oGNWGJl
	u8FwPcB7+vnNJHSB7Rh/exnfKHt0QS5VBPqF3OObN
X-Gm-Gg: ASbGncu906KDvf6EMSvRj2r9RsZt98w9Wnlyu702Fh7+UHlTAOujDywvQTEX1I4Gz5l
	Av1J264lTm2T+NDgCcwYDPzBmm9+K4ueXlWz3AQLj6OdefRVfVid3iWWkOmp83fpqG3glTrSo1k
	9iyz4xsKm+Flv5/6OQo5HGP02Du6wdIXWRbHod60yzoDBfr7QKEJlKTCLmZy1Leyyk1TgEz4Ebt
	fRTvO9Qcm0WH+apDpBAYYdbEhTJ/OYabSCgd34WfjW90HP85FhwTt9OeHBbyn8vQzLFA5GCdhWN
X-Google-Smtp-Source: AGHT+IEpA5EbdioaPf3qKcG8P0ENMXWxtvPYfa7xFgKk/+u0TeiDaVlv//85nDiCUfDvrpoSotwckmQ3+uGHWatx/5o=
X-Received: by 2002:a05:6214:224d:b0:804:9cab:926e with SMTP id
 6a1803df08f44-87b2ef64949mr172438546d6.38.1760122965415; Fri, 10 Oct 2025
 12:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006193839.1350626-1-elsk@google.com> <aOd6QzKQKcYoxMf0@levanger>
 <CAABy=s0yZ3BOOUHpEf1DXatYkSyk1hUwHVBmBAke7Tdvzn3AVA@mail.gmail.com> <aOlVYtE-aPpptqh5@levanger>
In-Reply-To: <aOlVYtE-aPpptqh5@levanger>
From: "Hong, Yifan" <elsk@google.com>
Date: Fri, 10 Oct 2025 12:02:09 -0700
X-Gm-Features: AS18NWAieVD9ozu5C9f_mxQ9ta11a-5mST_87LvwguzUKv7eM7lOPuLr7n_E47M
Message-ID: <CAABy=s2TBj4FD+D_VR9JiEuVgZo_KbZ5Z5U4CUD-69SLw-q=3w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use $(obj)/ instead of $(src)/ for COPY
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, kernel-team@android.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 11:57=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wr=
ote:
>
> On Thu, Oct 09, 2025 at 02:16:20PM -0700, Hong, Yifan wrote:
> > On Thu, Oct 9, 2025 at 2:16=E2=80=AFAM Nicolas Schier <nsc@kernel.org> =
wrote:
> > >
> > > On Mon, Oct 06, 2025 at 07:38:38PM +0000, HONG Yifan wrote:
> > > > Similar to
> > > > commit 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for co=
mmon pattern rules")
> > > >
> > > > This change updates the COPY rule to use $(obj) instead of $(src). =
This
> > > > makes Kbuild rules like
> > > >
> > > >     always-y +=3D libfoo/.foo.o.cmd
> > >
> > > This is a strange example.  Why should we ship any prebuilt .*.o.cmd =
file?
> >
> > When one ships the .o file, it might be beneficial to also ship the
> > accompanying .o.cmd file
> > so that compdb may work, I guess. Though, I just get this example from =
one
> > of the SoC manufacturers, so I actually don't know the true reasoning
> > behind it. I agree that it
> > isn't a good example.
> >
> > Still, this applies to any file that does NOT match any existing
> > pattern rules in Kbuild. It might be more
> > generic if I had said instead
> >
> >     always-y +=3D libfoo/foo.xyz
> >
> > ... and we were providing a libfoo/foo.xyz_shipped in the source tree.
> >
> > >
> > > >
> > > > work when the user provides libfoo/.foo.o.cmd_shipped, even when ob=
j and
> > > > src is different and src is an absolute path. This is useful when f=
oo.o
> > > > and .foo.o.cmd are checked-in as prebuilts.
> > > >
> > > > (Admittedly, `always-y +=3D libfoo/.foo.o.cmd` is not recommended i=
n
> > > > kbuild/modules.rst, "Several Subdirectories".)
> > > >
> > > > For example, if
> > > >
> > > >     obj=3D.
> > > >     src=3D/some/path
> > > >
> > > > then the original rule
> > > >
> > > >     $(obj)/%: $(src)/%_shipped
> > > >
> > > > expands to
> > > >
> > > >     ./%: /some/path/%_shipped
> > > >
> > > > And when matching against the above example, the stem is just `bar.=
o`
> > > > [^1] so the following is looked up:
> > > >
> > > >     libfoo/.foo.o.cmd: libfoo//some/path/.foo.o.cmd_shipped
> > > >
> > > > ... and it cannot be matched.
> > > >
> > > > With this change, the rule expands to
> > > >
> > > >     ./%: ./%_shipped
> > > >
> > > > ... and it should work, at least for files that does not have a mor=
e
> > > > specific pattern rule.
> > > >
> > > > NOTE: that after this change, code like
> > > >
> > > >     bar-y +=3D libfoo/foo.o
> > > >
> > > > ... with libfoo/foo.o_shipped provided still DOES NOT work, because
> > > > the pattern rule $(obj)/%.o takes priority. For .o_shipped files,
> > > > the user still needs an explicit `$(obj)/%.o: $(obj)/%.o_shipped` r=
ule
> > > > in its own Kbuild file.
> > > >
> > > > [^1]: https://www.gnu.org/software/make/manual/html_node/Pattern-Ma=
tch.html
> > > >
> > > > Signed-off-by: HONG Yifan <elsk@google.com>
> > > > ---
> > > >  scripts/Makefile.lib | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > > index 1d581ba5df66..e066b7b00bcc 100644
> > > > --- a/scripts/Makefile.lib
> > > > +++ b/scripts/Makefile.lib
> > > > @@ -272,7 +272,7 @@ endef
> > > >  quiet_cmd_copy =3D COPY    $@
> > > >        cmd_copy =3D cat $< > $@
> > > >
> > > > -$(obj)/%: $(src)/%_shipped
> > > > +$(obj)/%: $(obj)/%_shipped
> > > >       $(call cmd,copy)
> > >
> > > No, I don't see a reason to support *_shipped files from the build tr=
ee.
> > > The purpose of *_shipped is to deliver prebuilt files with the source
> > > tree to allow or simplify building the corresponding output files.
> >
> > The goal is not to support .o_shipped files from the build tree,
> > though it is indeed one
> > side effect of the patch. My goal is that we support .o_shipped files
> > from the source tree when all
> > of the following is true:
> >
> > - We are building with O=3D / MO=3D, so $(obj) and $(src) are different=
,
> > and in this case $(obj) is `.` and
> >   $(src) is an absolute path);
> > - We have a `xxx-y +=3D libfoo/bar.o` line; in other words, the
> > bar.o_shipped file is in a **subdirectory**
> >   libfoo below the directory of the Kbuild file. As I said in the
> > commit message, this is NOT recommended
> >   (kbuild/modules.rst, "Several Subdirectories"), but it is a
> > documented way to include a .o file from
> >   elsewhere.
> >
> > And as I said in the commit message at the end, unfortunately this
> > patch still can't achieve this goal for .o files,
> > only for files that don't match any existing pattern rules, like .cmd
> > files for example.
> >
> > Would you please suggest how we can support .o_shipped files in a
> > subdirectory when building with
> > $(obj) =3D . and $(src) =3D <some absolute path>? Thank you!
>
> Thanks for the clarifications.  Please note that shipping .o_shipped
> files with upstream Linux will not happen out of obvious reasons, and I
> am not willing to invest time into supporting any closed-source
> approach.

Thanks for your reply. This is primarily for out-of-tree modules which
are not yet ready to be upstreamed. I agree that shipping prebuilt .o
files does not make sense in upstream Linux.

>
> You might want to try to add the missing rules to your local modules'
> Kbuild file, e.g. something like
>
> $(obj)/%.o: $(obj)/%.o.cmd
>
> $(obj)/%: $(src)/%_shipped | $(obj)/%.o.cmd
>         $(call cmd,copy)

Thanks. This is my current workaround now. I'll treat this as an
acceptable solution for now.

Please kindly disregard this patch.

>
> (not tested, no support).
>
> Good luck and kind regards,
> Nicolas

