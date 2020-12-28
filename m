Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EAD2E69A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Dec 2020 18:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgL1RUH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 12:20:07 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:37043 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728125AbgL1RUH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 12:20:07 -0500
Date:   Mon, 28 Dec 2020 17:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609175964;
        bh=leLQ7HLOOBAi96gGzZ6lvQ1zwU5ypDUPyx8uomLDoZU=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=owzcvxZoYmH6GH6qBht0MRdwycosO+m3EClz9L2BwFJ6YUKGyav9wa+6bTOWNxVOj
         zLNFA2FnmwvyibgCn2XXc8jvK0dPbxhqc2KICloFMk7ETmoGMEamdbsD3OWZrtkJK9
         TM5DR3BH52g27kH0uGavOJyIJiekVnf0KkDfH2p8=
To:     corbet@lwn.net
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        masahiroy@kernel.org, mchehab+huawei@kernel.org,
        mchehab@kernel.org, michal.lkml@markovi.net
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH RFC v2] docs: experimental: build PDF with rst2pdf
Message-ID: <20201228171907.159028-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 11, 2020 at 05:03:50PM -0700, Jonathan Corbet wrote:
> The right solution is probably something like this:
>=20
> =09try:
> =09    import rst2pdf
> =09    extensions.append('rst2pdf.pdfbuilder')
> =09except ModuleNotFoundError:
> =09    pass # no rst2pdf for you

I tested it, but it still fails, and the error message is even more cryptic=
:

=09Sphinx error:
=09Builder name pdf not registered or available through entry point
=09make[1]: *** [Documentation/Makefile:120: rst2pdf] Error 2
=09make: *** [Makefile:1663: rst2pdf] Error 2

It seems to me that the missing dependency should be treated in the Makefil=
e
target rather than in Sphinx. Looking through the Makefile, I took inspirat=
ion
from the latex version and did the following:

=09HAVE_RST2PDF :=3D $(shell if python -c "import rst2pdf" >/dev/null 2>&1;=
 then echo 1; else echo 0; fi)

=09=20
=09ifeq ($(HAVE_RST2PDF),0)

=09rst2pdf:
=09       $(warning The 'rst2pdf' python module was not found. Make sure yo=
u have it installed to produce PDF output.)
=09       @echo "  SKIP    Sphinx $@ target."

=09else # HAVE_RST2PDF

=09rst2pdf:
=09       @$(srctree)/scripts/sphinx-pre-install --version-check
=09       @+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,pdf,$(var),p=
df,$(var)))

=09endif # HAVE_RST2PDF

With this, the following message is shown in case it isn't installed:

=09Documentation/Makefile:122: The 'rst2pdf' python module was not found. M=
ake sure you have it installed to produce PDF output.
=09  SKIP    Sphinx rst2pdf target.

But with that check on the Makefile in place, on the Sphinx side, we can in=
deed
just do Jon's snippet to only add the extension if it is installed. Another
option would be to split the 'try' into 'try' and 'else', where the 'else' =
only
executes if the 'try' is succesful. The benefit is that this makes it clear=
er
that only the import is being "tried":

=09# Enable experimental rst2pdf, if available
=09try:
=09    import rst2pdf
=09except ModuleNotFoundError:
=09    pass
=09else:
=09    extensions.append("rst2pdf.pdfbuilder")

Something interesting I noticed is that when building with Sphinx 3, and if
rst2pdf is installed, even when building other targets, like htmldocs, (sin=
ce
the rst2pdf extension is added based on rst2pdf being installed and not if =
it is
being used) the following is printed:

=09WARNING: the rst2pdf.pdfbuilder extension is not safe for parallel writi=
ng
=09WARNING: doing serial write

Looking into rst2pdf's pdfbuilder.py, indeed 'parallel_write_safe' is False=
, so
we should probably make sure rst2pdf isn't negatively impacting build time =
for
other formats before merging this patch.

Thanks,
N=C3=ADcolas

