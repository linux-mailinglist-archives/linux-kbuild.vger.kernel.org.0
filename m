Return-Path: <linux-kbuild+bounces-2206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C309A90D9DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 18:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8317D2897BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 16:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337182D6D;
	Tue, 18 Jun 2024 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhYDYsns"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5586C4CB4B;
	Tue, 18 Jun 2024 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729475; cv=none; b=NvBMmsfIcsWq5C8zPwhdDGYJTnSCP+gDiO2sn5Gzt7rgpFA+KORa84fzCZ0hOfAXnLbwDzUpqSO2UjBclpDqhQWjcm0jd19XKPfKlRZ3fKyyXtP7sC0ANqooPLbVWXHyhS8mv9gr3zEcn6cFszH6yTk9eDccT6Hv1cr8Gd8mcH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729475; c=relaxed/simple;
	bh=PYwVMDAiC3RFinNw6W/w2pZAP4HWbkTkG/3WbS/uhJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRIB2y+aFtmu6r6jvPMWf1VfrfpoJJBLIgOVbplig4gjqG1ez5l9chSkSEMtK1fIr6rbkF2H5ibGs4so6Nog+WCCF2RaNVk//R1CyDkptq1++uLP1M19XgSPPwndUwNQmuhlzRZBu5oaggmW3Jx0zrArRPw9X1CYkrzkpyDISEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhYDYsns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82F8C4AF48;
	Tue, 18 Jun 2024 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718729474;
	bh=PYwVMDAiC3RFinNw6W/w2pZAP4HWbkTkG/3WbS/uhJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DhYDYsns1VmefSrocJnh8lhPn4dG74YKBaXFckRJH7y5koD+BCiWiFAYpLcyN5Cmd
	 LyYd81Sv4vGy0J1JHjvEKCW7W+RU2cmJcZT/18j7TwoYzM65DfSV2XBCKlTPX2xl8g
	 y3Ed54zMBNb7whp5cTXfSp6oFJ3uYC7gXp/uvZ1O0UsqCvIUxScmlEefxIa00fgoh8
	 PnXrtZQj5SkzbhWyt8PczbDwKmuE9cvANi/oiwi5NDiAZC5WzCmZAwLUCLbsPEjfGN
	 6BF/tmCctqfjLwiSa5Qqk3R1D756qW7+P/8YgJvOMMGS6SbRz716KzyISrIwv5+Q0M
	 7387U5R+6UkSg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c89d6b4adso5136891e87.3;
        Tue, 18 Jun 2024 09:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoEYc+z/SpwiSrz50Z6K9rjzczVjHTDIpjkIdmJtPfj5yplskIMF9cbtwemsr8YrknsaS+oDRUeuKJefBzL+Gv6rM0XJVY85z5J39HlIkwwa1b6yid+2xcA1lS2OxOdAS6FHEru7iz5EGrhz+DvNZwumI8Pfi62eR+i04dC5eBGSHKyX6uP9Fi36BCSbaXF4UHxz1E1UQNpls4RMI4oPCW1S3JuIl9Du+Z
X-Gm-Message-State: AOJu0Yy3xfH35MMGPiAK0WcIj7gz9SCBCuXBFqKXgTWT7Nv/AL5QlyQO
	vPYXBBAiYV1ELi2a504dXT7eGP9MtKxU+6ske+srDdbN5T8useTm37g4v5fW+XBGb1yAYm34544
	qhrDO9ZnM2mBbpNp5bJoRiD3Erfc=
X-Google-Smtp-Source: AGHT+IEiRX7GEsAqXvuZkzKWEDQYGYj5Zs1pfZ0hxtklKEBiqui3d6dIT3EMtVA4nIPtaY1zvaTLydirlE0A+d90cJM=
X-Received: by 2002:a19:e04b:0:b0:52c:856a:d45f with SMTP id
 2adb3069b0e04-52ccaa5b881mr102099e87.19.1718729473554; Tue, 18 Jun 2024
 09:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com> <2024061842-hatless-viewpoint-5024@gregkh>
In-Reply-To: <2024061842-hatless-viewpoint-5024@gregkh>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Jun 2024 01:50:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_OsXeoDRoMbdXUGY=-jhuoHgo-L6W79n+Kb4G4xEBwQ@mail.gmail.com>
Message-ID: <CAK7LNAS_OsXeoDRoMbdXUGY=-jhuoHgo-L6W79n+Kb4G4xEBwQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 1:44=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 17, 2024 at 05:58:19PM +0000, Sami Tolvanen wrote:
> > Hi folks,
> >
> > This series implements CONFIG_MODVERSIONS for Rust, an important
> > feature for distributions like Android that want to ship Rust
> > kernel modules, and depend on modversions to help ensure module ABI
> > compatibility.
> >
> > There have been earlier proposals [1][2] that would allow Rust
> > modules to coexist with modversions, but none that actually implement
> > symbol versioning. Unlike C, Rust source code doesn't have sufficient
> > information about the final ABI, as the compiler has considerable
> > freedom in adjusting structure layout for improved performance [3],
> > for example, which makes using a source code parser like genksyms
> > a non-starter. Based on Matt's suggestion and previous feedback
> > from maintainers, this series uses DWARF debugging information for
> > computing versions. DWARF is an established and relatively stable
> > format, which includes all the necessary ABI details, and adding a
> > CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> > reasonable trade-off.
> >
> > The first 12 patches of this series add a small tool for computing
> > symbol versions from DWARF, called gendwarfksyms. When passed a list
> > of exported symbols, the tool generates an expanded type string
> > for each symbol, and computes symbol CRCs similarly to genksyms.
> > gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> > because of the existing support for C host tools that use elfutils
> > (e.g., objtool).
>
> That's cool, can the C code be switched to also use this?  That way we
> only have one path/code for all of this?


As the description says, it requires CONFIG_DEBUG_INFO.
We can strip the debug info from the final vmlinux, but
I guess the build speed will be even slower than the current genksyms.




--=20
Best Regards
Masahiro Yamada

