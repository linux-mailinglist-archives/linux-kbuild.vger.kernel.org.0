Return-Path: <linux-kbuild+bounces-3627-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D097CCBD
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 18:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0191F1F23B77
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFB719F433;
	Thu, 19 Sep 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gtl4CYPD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494214F98;
	Thu, 19 Sep 2024 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726764877; cv=none; b=YPjALGVJ95NxRov64aeMvzhwacD41BAJQJbTqVNsGS2+jMCy6QOU8C8oPpBHflWZGd2W2uihTYolFkR+lohEnhFTRIQ1F37N7SeWe3AZDZbJ0PqigkIIboyD+e4e6wvyDfn8D8eIMf/MZcZ07lRPEiwx+UaZVSmmiJeQqFKj6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726764877; c=relaxed/simple;
	bh=KOhrJiIshTb1OpPyQQvp49IsLx81dr58aho0eHExREI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9xwBVddpGHd8uIiHCFq65q3T9Zd8lC8grPYs8V6VjXa2nBg9d51c6/HJnoc7Gf6IWiD/K+3FKphbOcOk1zn5pZR03dEOs0b1ey8MPxWrWlLMm4KUkjUDuyOxDdLPCrY+j8axK8Y7ktb1d9C9NAB5RaU8T+Qzj/dcJeW65aeFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gtl4CYPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8885C4CECE;
	Thu, 19 Sep 2024 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726764876;
	bh=KOhrJiIshTb1OpPyQQvp49IsLx81dr58aho0eHExREI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gtl4CYPDKHsj+01dmY1sEkpYO2xeMulFz7QLZYO6+5L3SQdhobGds2ITCiLy3kQac
	 /EwO1t6gVI4SNvdtM7Dt7zFFkXxgSLbW3Hb2W9RMyJE2prTqxGVf+q1VkoixrOGFbw
	 KCSc9jfYc9XxLzIMOLKcp7MMakW94DKh21i9dnfJYd+s8fjKROTTHbfLeP4F5hm8Ob
	 M1vc6DZEVzT8IOCycHVvoYA8dFwUUszUWR8X2QSNlk6hdob7B4u41Tc2wXCuEkkCvj
	 7Owss05bqAibSI+zmWnP2qfePBf5soSlREwnHAXAjNvSOGckH7zsX+4JWEhF87eXOi
	 wyqFczuIiZvmw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so11352731fa.3;
        Thu, 19 Sep 2024 09:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUi/9g7mbNE+YnLovk7lRuo660xWsrmOTntRQC1NYZa1fEROXuS881fBd9swwlL5u14rCHGznxNr2lraxE=@vger.kernel.org, AJvYcCUuM8HAgAZiPqHH0Z03RbEOAxsBM2wJSxAaX7wzOK5epwFAUPcNT0tDFBNLJg+ObsEJeoCR5BI8pIqByoZZPGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxyunnuuKBHPwA1O/3cYOKPw7HrM4k3/DLulINq7a33Vd4UfSv
	qJDdo7cHY8+WV16CNAZE79ySMcL+19dNcS4shN4ulWQ+Fxlga36Fw5Z2VKr9/iMhVvuE0jMZoed
	mRXT1X/YUhB0t1he8OPjJ0vQMkBQ=
X-Google-Smtp-Source: AGHT+IFhuePW8rNcXV6JZlcNLCTba6sLje14MEX0SQW9HdS1v7f/TnZcVoaCRRA7xNspiY8Ac4OElOWIR7WdH/1Acfw=
X-Received: by 2002:a2e:be1b:0:b0:2f7:56c2:7288 with SMTP id
 38308e7fff4ca-2f7cb2cfe47mr1755291fa.7.1726764875384; Thu, 19 Sep 2024
 09:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-5-masahiroy@kernel.org>
 <Zur-pVW_2oBJdjgy@l-nschier-nb>
In-Reply-To: <Zur-pVW_2oBJdjgy@l-nschier-nb>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Sep 2024 01:53:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNATf0MznDOOaz9gkhT+a95q=Y0ocaLrJT6wrj3sYrEi3wQ@mail.gmail.com>
Message-ID: <CAK7LNATf0MznDOOaz9gkhT+a95q=Y0ocaLrJT6wrj3sYrEi3wQ@mail.gmail.com>
Subject: Re: [PATCH 04/23] kbuild: doc: remove the description about shipped files
To: Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 1:24=E2=80=AFAM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> On Tue, Sep 17, 2024 at 11:16:32PM +0900, Masahiro Yamada wrote:
> > The use of shipped files is discouraged in the upstream kernel these
> > days. [1]
> >
> > Downstream Makefiles have the freedom to use shipped files or other
> > options to handle binaries, but this is not what should be advertised
> > in the upstream document.
> >
> > [1]: https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895C=
bOAi8ok+7-CQUN=3DfQ@mail.gmail.com/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Documentation/kbuild/modules.rst | 35 +++-----------------------------
> >  1 file changed, 3 insertions(+), 32 deletions(-)
>
> Do you want to remove the TODO point refering to *_shipped files from
> Documentation/kbuild/makefiles.rst as well?


Yes.

Good catch.



> $ git grep -Hrne _shipped Documentation/
> Documentation/kbuild/makefiles.rst:1668:- Describe how kbuild supports sh=
ipped files with _shipped.
>
> >
> > diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/mo=
dules.rst
> > index 7eceb9a65e9c..1afa6b1b4090 100644
> > --- a/Documentation/kbuild/modules.rst
> > +++ b/Documentation/kbuild/modules.rst
> [...]
> > @@ -240,35 +235,11 @@ module 8123.ko, which is built from the following=
 files::
> >               default:
> >                       $(MAKE) -C $(KDIR) M=3D$$PWD
> >
> > -             # Module specific targets
> > -             genbin:
> > -                     echo "X" > 8123_bin.o_shipped
> > -
> >       The split in example 2 is questionable due to the simplicity of
> >       each file; however, some external modules use makefiles
> >       consisting of several hundred lines, and here it really pays
> >       off to separate the kbuild part from the rest.
> >
> > -3.3 Binary Blobs
> > -----------------
> > -
> > -     Some external modules need to include an object file as a blob.
> > -     kbuild has support for this, but requires the blob file to be
> > -     named <filename>_shipped. When the kbuild rules kick in, a copy
> > -     of <filename>_shipped is created with _shipped stripped off,
> > -     giving us <filename>. This shortened filename can be used in
> > -     the assignment to the module.
> > -
> > -     Throughout this section, 8123_bin.o_shipped has been used to
> > -     build the kernel module 8123.ko; it has been included as
> > -     8123_bin.o::
> > -
> > -             8123-y :=3D 8123_if.o 8123_pci.o 8123_bin.o
> > -
> > -     Although there is no distinction between the ordinary source
> > -     files and the binary file, kbuild will pick up different rules
> > -     when creating the object file for the module.
> > -
>
> I think renumbering the following sections would provide a more consisten=
t document.  If you think that keeping the numbering constant:  would you m=
ind adding a note about section 3.3 being removed?
> (And possibly as well in the table of contents?)

Rather, I'd like to remove section numbers.

Let me do that way.


> Either way,
>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>



--=20
Best Regards
Masahiro Yamada

