Return-Path: <linux-kbuild+bounces-8013-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D7BB06449
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Jul 2025 18:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337D61888224
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Jul 2025 16:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFC224A046;
	Tue, 15 Jul 2025 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7w9kXb8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB961E531;
	Tue, 15 Jul 2025 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752596644; cv=none; b=CNhLjW3IKNi0VrLEtYynWhjuFExG+pEHdKM6ABsQlBg0XjwnKhWSlbC0bYgt3tiLqEuwtdwCEtB90sXSAr8YooKUp3n8z2dq29BRV9LZxMvlhEmjAL0cvIi8zq/pEFH1fW1n4c4PGxt1xHxMnSyjc/0P3qZVz4irBZ7+fiHzOVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752596644; c=relaxed/simple;
	bh=ypdvZi4C3Z+of5UOdXEtOkt3tXWzCN7U+wilMCajHtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hzpl9712AbLnqlwosA1BELhEoe/FpoPYPRwsxx/9NVQeU1lNi//N56XZm/AAICWyHejcILQ4NWEJydWc361brnOEkNYq9LW5GXjzSWilBrXcFLAGDNCfple4vTKgZatWdRKFEPzCYYDkE2BcjCC0BtD/kkfhiN/D8wvZkVaWhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7w9kXb8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D640EC4AF09;
	Tue, 15 Jul 2025 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752596643;
	bh=ypdvZi4C3Z+of5UOdXEtOkt3tXWzCN7U+wilMCajHtI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m7w9kXb8s3bIxMkLmxvu3NoxWJzGxW+5kgO62M3JnKCNm6bp6v1lwt9oqNlAmATm1
	 8C9XDM7ib9He2pny6kJAtHXNdhwzc5rXo+4tV6qcREMSKeFhyyfB+Z1zoMLyEVGzgm
	 ZPmxl6665ylJZJIWf1Ov5j7XQeNR0zr8zusiqbqbAeOAsQjTx5rQZJLizOqrbb/oak
	 VLjt9PC2LJytxuMrGTH97kXK6ZFe5nIOXVJSL3tLK4YQJ31pQZTDq7ZD5RoSeqOun3
	 tgVnH1lJavQLJOerz8DX6HEotzDUoHcJv4GI+S1PPJmyM8DD8IM4iXEnTRqxMP4Vim
	 SmegHpQQLI4uA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so45711771fa.0;
        Tue, 15 Jul 2025 09:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMgqWwWGEiT5eb7L3X7xKWJihI0XtUMNq0gBlDOMPWhHTai7hOSoDsJDVtMtU2RMFuwO+bOG441Foctgg=@vger.kernel.org, AJvYcCVv+4b8E6nMely/sZPV8CPev2WutOnsIIcK2KF2O9XnriSq/NlmFBJCyJlivRlye8uP2hhNpgGd2h/3eQ==@vger.kernel.org, AJvYcCWDuvMFgnXCy3byD4y9gZe77uKpfV3cS+OD+bUkhuCGGRiPjuDCSwUPW7je8fT06O8N+6kCM0HAUycRgkJU@vger.kernel.org, AJvYcCWPNPrRlHRmoi5YyKQCy7MRNh+7OpA5vAyrlcQ3WWdCL+wgwPxRaJq0hFrXSED73bgfGqy6mFsMOHld5Q28zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzb1NT9WN3bzHkc0U2ULkdNqOXZqaQnsF0yuiQ01YvQAo9/Jx
	BljtYfMjomr8YebGCEMBXEeWDxiLEqaEfzJzmXsQSIrjdIL4EAzUfCY5noqoRbs96xNBQ35K0UD
	kSNWNZBQ3E6/BfinMDxsb5X6pQzbyJxs=
X-Google-Smtp-Source: AGHT+IE8yI+8Uh3TQfZOWwMNgf9mfWOLLx6nww3kIvvkryyNoEKo4fQ9DxLndtRAs5+3MObk+OBoLdVvUlZtOpgJgbo=
X-Received: by 2002:a05:651c:210c:b0:30b:c91d:35cb with SMTP id
 38308e7fff4ca-3305329a499mr55679671fa.4.1752596642472; Tue, 15 Jul 2025
 09:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750511018.git.legion@kernel.org> <aHUI8KqD0_dtTY3D@example.org>
In-Reply-To: <aHUI8KqD0_dtTY3D@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 16 Jul 2025 01:23:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjC_FCam14RXfTVTQ4_jtXuBKfDsdyG84_k9L1x5zJyg@mail.gmail.com>
X-Gm-Features: Ac12FXyNiVf7O3i_gGa-RGhfYZg1qgGQG9fKPtU3XEYprQujcBuexCj04eQQ3Ic
Message-ID: <CAK7LNARjC_FCam14RXfTVTQ4_jtXuBKfDsdyG84_k9L1x5zJyg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add generated modalias to modules.builtin.modinfo
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, sorry for the delay.

On Mon, Jul 14, 2025 at 10:41=E2=80=AFPM Alexey Gladkov <legion@kernel.org>=
 wrote:
>
> On Sat, Jun 21, 2025 at 03:57:12PM +0200, Alexey Gladkov wrote:
> > The modules.builtin.modinfo file is used by userspace (kmod to be speci=
fic) to
> > get information about builtin modules. Among other information about th=
e module,
> > information about module aliases is stored. This is very important to d=
etermine
> > that a particular modalias will be handled by a module that is inside t=
he
> > kernel.
> >
> > There are several mechanisms for creating modalias for modules:
> >
> > The first is to explicitly specify the MODULE_ALIAS of the macro. In th=
is case,
> > the aliases go into the '.modinfo' section of the module if it is compi=
led
> > separately or into vmlinux.o if it is builtin into the kernel.
> >
> > The second is the use of MODULE_DEVICE_TABLE followed by the use of the
> > modpost utility. In this case, vmlinux.o no longer has this information=
 and
> > does not get it into modules.builtin.modinfo.
> >
> > For example:
> >
> > $ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> > modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc=
03i30 not found.
> >
> > $ modinfo xhci_pci
> > name:           xhci_pci
> > filename:       (builtin)
> > license:        GPL
> > file:           drivers/usb/host/xhci-pci
> > description:    xHCI PCI Host Controller Driver
> >
> > The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which =
will be
> > generated by modpost if the module is built separately.
> >
> > To fix this it is necessary to add the generated by modpost modalias to
> > modules.builtin.modinfo.
> >
> > Fortunately modpost already generates .vmlinux.export.c for exported sy=
mbols. It
> > is possible to use this file to create a '.modinfo' section for builtin=
 modules.
> > The modules.builtin.modinfo file becomes a composite file. One part is =
extracted
> > from vmlinux.o, the other part from .vmlinux.export.o.
>
> Masahiro Yamada, does this version of the patchset look better to you ?


Looks better, but this may break s390 build:

https://lore.kernel.org/linux-kbuild/202506062053.zbkFBEnJ-lkp@intel.com/

I have not taken a close look at it.
If we do not find how to fix the warning, we would
end up with the original solution.





> > Notes:
> > - v4:
> >   * Rework the patchset based on top of Masahiro Yamada's patches.
> >   * Add removal of unnecessary __mod_device_table__* symbols to avoid s=
ymbol
> >     table growth in vmlinux.
> >   * rust code takes into account changes in __mod_device_table__*.
> >   * v3: https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.=
org/
> >
> > - v3:
> >   * Add `Reviewed-by` tag to patches from Petr Pavlu.
> >   * Rebase to v6.15.
> >   * v2: https://lore.kernel.org/all/20250509164237.2886508-1-legion@ker=
nel.org/
> >
> > - v2:
> >   * Drop patch for mfd because it was already applied and is in linux-n=
ext.
> >   * The generation of aliases for builtin modules has been redone as
> >     suggested by Masahiro Yamada.
> >   * Rebase to v6.15-rc5-136-g9c69f8884904
> >   * v1: https://lore.kernel.org/all/cover.1745591072.git.legion@kernel.=
org/
> >
> >
> > Alexey Gladkov (3):
> >   scsi: Always define blogic_pci_tbl structure
> >   modpost: Add modname to mod_device_table alias
> >   modpost: Create modalias for builtin modules
> >
> > Masahiro Yamada (4):
> >   module: remove meaningless 'name' parameter from __MODULE_INFO()
> >   kbuild: always create intermediate vmlinux.unstripped
> >   kbuild: keep .modinfo section in vmlinux.unstripped
> >   kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
> >
> >  drivers/scsi/BusLogic.c           |  2 -
> >  include/asm-generic/vmlinux.lds.h |  2 +-
> >  include/crypto/algapi.h           |  4 +-
> >  include/linux/module.h            | 21 ++++-----
> >  include/linux/moduleparam.h       |  9 ++--
> >  include/net/tcp.h                 |  4 +-
> >  rust/kernel/device_id.rs          |  8 ++--
> >  scripts/Makefile.vmlinux          | 74 +++++++++++++++++++++----------
> >  scripts/Makefile.vmlinux_o        | 26 +----------
> >  scripts/mksysmap                  |  6 +++
> >  scripts/mod/file2alias.c          | 34 ++++++++++++--
> >  scripts/mod/modpost.c             | 17 ++++++-
> >  scripts/mod/modpost.h             |  2 +
> >  13 files changed, 131 insertions(+), 78 deletions(-)
> >
> > --
> > 2.49.0
> >
>
> --
> Rgrds, legion
>


--=20
Best Regards
Masahiro Yamada

