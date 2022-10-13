Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB5E5FE4FF
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Oct 2022 00:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiJMWI5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Oct 2022 18:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiJMWI5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Oct 2022 18:08:57 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B5F183E11
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Oct 2022 15:08:56 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-132af5e5543so3908383fac.8
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Oct 2022 15:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6qezfoASNTylIg8meYe/iW+fRPaS8hVt6HhknbhwL0=;
        b=Wr4Oz0DYM7AOUF7kcxLb3898TvWE6PKIf9GLUVZyM4uRC6DCx0B4D611H3uTYR5cjz
         iaBaMYkKl4aMEmiHl/GCEaqxeosstJyIUF/QP0OMtqaG2u0vDOIVbiHFXBk0UFzBvytH
         bZXPgZEHRaT69voK58JYq5DNFIEkcn1ed8YrMy6Adk6n9VMM2QSHYviz7Y91pLsVd66o
         /Y7/QDiJSLfgroslZKiEwori0wPA4i80UT5KaT5A4IKOlgd2QYVilteSoLS4fw4b9L/R
         ndsbEN3gSu8axquKvwPpsEMCaYfNnG0+762i+G2ZZwTgRZFx1Zi4wYRRInry0gJFGTU9
         kS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6qezfoASNTylIg8meYe/iW+fRPaS8hVt6HhknbhwL0=;
        b=GwtDu65oqFSbLp+VojcEX+fnY9wfF/U7S3zvR3dFIESVlgs8CKZnoLJghEAjRxq/QI
         sLJ1PUdyHpo+Fas/SJE4eYAygqVzQUpdy30NVM/6XI72JCM16CjqK7dcy0OBY4hTbsYU
         VcodDgJ/W3AmKVscqNOJlBohHj1wwUHa2Nfgo1xGwk5HEzRFp2VyPHLtVgrDsX1AdPQo
         PCrG5qA9hUs4hYD0v5XrGgAmQMb9yDphYc9CLr9U8oAhvUAuRNtyOfuNUmPPVrMWxZDe
         DtCwMb98pA9Tdp/ZOwg55+yGZAPIY+pfJ/4vbwv035eT3mp1allJuXwbXzibYbQD2nGr
         j9Gw==
X-Gm-Message-State: ACrzQf1gFE7Rhw21RnmUj6jCcm8UceeO1/l368Le8FIkj0LFnbCrKzpN
        rD4Mjyjjh5dDnsFPzRUaX2vd0E7T+yzN9WGM4g3meg7d8BnVIg==
X-Google-Smtp-Source: AMsMyM43myMypjisfhm82T89inHm4XxnaKG7iS/5VVI+jRpsy5+gAnH1eTVs5hpkvAT2nMtDf4DWm44DmhrlGXl9xPA=
X-Received: by 2002:a05:6870:1685:b0:132:d9b7:5fd6 with SMTP id
 j5-20020a056870168500b00132d9b75fd6mr1069205oae.252.1665698935129; Thu, 13
 Oct 2022 15:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
 <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 14 Oct 2022 00:08:18 +0200
Message-ID: <CA+icZUXqj_Si5S9bwEF94CP6jpBgcMJdwp7+R3+TuUvbX8LpPA@mail.gmail.com>
Subject: Re: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     1008735@bugs.debian.org, Gioele Barabucci <gioele@svario.it>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000054fbdd05eaf1c17b"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--00000000000054fbdd05eaf1c17b
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 13, 2022 at 4:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
> Sorry for my late replay.
>
>
> On Mon, Oct 3, 2022 at 6:56 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > [ CC linux-kbuild folks (see [0] ]
>
>
>
> Can you give me more context of this email?
>
>
>
>
> > Hi,
> >
> > I am using Debian/unstable AMD64 and doing Linux-kernel upstream
> > development and testing.
> >
> > People using bindeb-pkg (mkdebian) from Linux-kernel sources
> > (scripts/packages) to build and test their selfmade Debian kernels get
> > a now a "n/a" for distribution.
>
>
>
> Right, if I try the latest sid,
> "lsb_release -cs" returns "n/a".
> It returned "sid" before IIRC.
>
>
> What was changed in Debian?
> Any change in the lsb_release program?
>

Hi Masahiro San,

The Debian maintainer(s) changed the co-working of these packages:

root# dpkg -l | egrep 'base-files|lsb-release' | awk '/^ii/ {print $1
" " $2 " " $3}' | column -t
ii  base-files           12.3
ii  lsb-release          12.0-1
ii  lsb-release-minimal  12.0-1

My findings:
First, /usr/bin/lsb_release-11.4 (python) VS.
/usr/bin/lsb_release-12.0 (shell) - both files attached.
Second, version 12.0 checks now explicitly for values in /etc/os-release.
As a side note: All these changes were not mentioned in lsb-release
debian/changelog.

The easiest way to fix this is to add...

VERSION_ID=sid (or unstable)

...to /etc/os-release file.

Just for the sake of technical correctness:
"sid" or "unstable" is not a numerical value - it's a string.

In version 12.3 of base-files "VERSION_CODENAME=bookworm" was added on
users' request.

Last checks:

Original (base-files version 12.0):

[ /etc/os-release ]
PRETTY_NAME="Debian GNU/Linux bookworm/sid"
NAME="Debian GNU/Linux"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

root# lsb_release --all
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux bookworm/sid
Release:        n/a
Codename:       bookworm

Modified:

[ /etc/os-release ]
PRETTY_NAME="Debian GNU/Linux bookworm/sid"
NAME="Debian GNU/Linux"
VERSION_CODENAME=bookworm
VERSION_ID=sid
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

root# lsb_release --all
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux bookworm/sid
Release:        sid
Codename:       bookworm

More comments see https://bugs.debian.org/1008735.

-Sedat-

>
>
>
>
>
> >
> > Background (see [1]):
> >
> > [ scripts/package/mkdebian ]
> >
> > # Try to determine distribution
> > if [ -n "$KDEB_CHANGELOG_DIST" ]; then
> >         distribution=$KDEB_CHANGELOG_DIST
> > # In some cases lsb_release returns the codename as n/a, which breaks
> > dpkg-parsechangelog
> > elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n
> > "$distribution" ] && [ "$distribution" != "n/a" ]; then
> >         : # nothing to do in this case
> > else
> >         distribution="unstable"
> >         echo >&2 "Using default distribution of 'unstable' in the changelog"
> >         echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
> > fi
> >
> > Personally, I set hardcoded in my kernel build-script as a workaround:
> >
> > distribution="bookworm"
> >
> > Gioele suggested me to enrich /etc/os-release with:
> >
> > VERSION_ID=unstable <--- XXX: I prefer sid because of PRETTY_NAME and
> > it's shorter
> > VERSION_CODENAME=bookworm
> >
> > In the end the file looks like:
> >
> > PRETTY_NAME="Debian GNU/Linux bookworm/sid"
> > NAME="Debian GNU/Linux"
> > ID=debian
> > VERSION_ID=sid
> > VERSION_CODENAME=bookworm
> > HOME_URL="https://www.debian.org/"
> > SUPPORT_URL="https://www.debian.org/support"
> > BUG_REPORT_URL="https://bugs.debian.org/"
> >
> > ...and this seems to work:
> >
> > # lsb_release -cs
> > No LSB modules are available.
> > bookworm
> >
> > Please, provide a solution not to break workflows that were successful
> > for years.
> >
> > Thanks.
> >
> > Best regards,
> > -Sedat-
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n11005
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/mkdebian#n123
>
>
>
> --
> Best Regards
> Masahiro Yamada

--00000000000054fbdd05eaf1c17b
Content-Type: application/x-troff-man; name="lsb_release-11.4"
Content-Disposition: attachment; filename="lsb_release-11.4"
Content-Transfer-Encoding: base64
Content-ID: <f_l97li0zm0>
X-Attachment-Id: f_l97li0zm0

IyEvdXNyL2Jpbi9weXRob24zIC1FcwoKIyBsc2JfcmVsZWFzZSBjb21tYW5kIGZvciBEZWJpYW4K
IyAoQykgMjAwNS0xMCBDaHJpcyBMYXdyZW5jZSA8bGF3cmVuY2NAZGViaWFuLm9yZz4KCiMgICAg
VGhpcyBwYWNrYWdlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkKIyAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQojICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IHZlcnNpb24gMiBkYXRlZCBKdW5lLCAxOTkxLgoKIyAgICBUaGlzIHBhY2thZ2UgaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyAgICBidXQg
V0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
ZgojICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUKIyAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRh
aWxzLgoKIyAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZQojICAgIGFsb25nIHdpdGggdGhpcyBwYWNrYWdlOyBpZiBub3Qs
IHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCiMgICAgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJh
bmtsaW4gU3QsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BCiMgICAgMDIxMTAtMTMwMSBVU0EKCmZy
b20gb3B0cGFyc2UgaW1wb3J0IE9wdGlvblBhcnNlcgppbXBvcnQgc3lzCmltcG9ydCBvcwppbXBv
cnQgcmUKCmltcG9ydCBsc2JfcmVsZWFzZQoKZGVmIG1haW4oKToKICAgIHBhcnNlciA9IE9wdGlv
blBhcnNlcigpCiAgICBwYXJzZXIuYWRkX29wdGlvbignLXYnLCAnLS12ZXJzaW9uJywgZGVzdD0n
dmVyc2lvbicsIGFjdGlvbj0nc3RvcmVfdHJ1ZScsCiAgICAgICAgICAgICAgICAgICAgICBkZWZh
dWx0PUZhbHNlLAogICAgICAgICAgICAgICAgICAgICAgaGVscD0ic2hvdyBMU0IgbW9kdWxlcyB0
aGlzIHN5c3RlbSBzdXBwb3J0cyIpCiAgICBwYXJzZXIuYWRkX29wdGlvbignLWknLCAnLS1pZCcs
IGRlc3Q9J2lkJywgYWN0aW9uPSdzdG9yZV90cnVlJywKICAgICAgICAgICAgICAgICAgICAgIGRl
ZmF1bHQ9RmFsc2UsCiAgICAgICAgICAgICAgICAgICAgICBoZWxwPSJzaG93IGRpc3RyaWJ1dG9y
IElEIikKICAgIHBhcnNlci5hZGRfb3B0aW9uKCctZCcsICctLWRlc2NyaXB0aW9uJywgZGVzdD0n
ZGVzY3JpcHRpb24nLAogICAgICAgICAgICAgICAgICAgICAgZGVmYXVsdD1GYWxzZSwgYWN0aW9u
PSdzdG9yZV90cnVlJywKICAgICAgICAgICAgICAgICAgICAgIGhlbHA9InNob3cgZGVzY3JpcHRp
b24gb2YgdGhpcyBkaXN0cmlidXRpb24iKQogICAgcGFyc2VyLmFkZF9vcHRpb24oJy1yJywgJy0t
cmVsZWFzZScsIGRlc3Q9J3JlbGVhc2UnLAogICAgICAgICAgICAgICAgICAgICAgZGVmYXVsdD1G
YWxzZSwgYWN0aW9uPSdzdG9yZV90cnVlJywKICAgICAgICAgICAgICAgICAgICAgIGhlbHA9InNo
b3cgcmVsZWFzZSBudW1iZXIgb2YgdGhpcyBkaXN0cmlidXRpb24iKQogICAgcGFyc2VyLmFkZF9v
cHRpb24oJy1jJywgJy0tY29kZW5hbWUnLCBkZXN0PSdjb2RlbmFtZScsCiAgICAgICAgICAgICAg
ICAgICAgICBkZWZhdWx0PUZhbHNlLCBhY3Rpb249J3N0b3JlX3RydWUnLAogICAgICAgICAgICAg
ICAgICAgICAgaGVscD0ic2hvdyBjb2RlIG5hbWUgb2YgdGhpcyBkaXN0cmlidXRpb24iKQogICAg
cGFyc2VyLmFkZF9vcHRpb24oJy1hJywgJy0tYWxsJywgZGVzdD0nYWxsJywKICAgICAgICAgICAg
ICAgICAgICAgIGRlZmF1bHQ9RmFsc2UsIGFjdGlvbj0nc3RvcmVfdHJ1ZScsCiAgICAgICAgICAg
ICAgICAgICAgICBoZWxwPSJzaG93IGFsbCBvZiB0aGUgYWJvdmUgaW5mb3JtYXRpb24iKQogICAg
cGFyc2VyLmFkZF9vcHRpb24oJy1zJywgJy0tc2hvcnQnLCBkZXN0PSdzaG9ydCcsCiAgICAgICAg
ICAgICAgICAgICAgICBhY3Rpb249J3N0b3JlX3RydWUnLCBkZWZhdWx0PUZhbHNlLAogICAgICAg
ICAgICAgICAgICAgICAgaGVscD0ic2hvdyByZXF1ZXN0ZWQgaW5mb3JtYXRpb24gaW4gc2hvcnQg
Zm9ybWF0IikKICAgIAogICAgKG9wdGlvbnMsIGFyZ3MpID0gcGFyc2VyLnBhcnNlX2FyZ3MoKQog
ICAgaWYgYXJnczoKICAgICAgICBwYXJzZXIuZXJyb3IoIk5vIGFyZ3VtZW50cyBhcmUgcGVybWl0
dGVkIikKCiAgICBzaG9ydCA9IChvcHRpb25zLnNob3J0KQogICAgbm9uZSA9IG5vdCAob3B0aW9u
cy5hbGwgb3Igb3B0aW9ucy52ZXJzaW9uIG9yIG9wdGlvbnMuaWQgb3IKICAgICAgICAgICAgICAg
IG9wdGlvbnMuZGVzY3JpcHRpb24gb3Igb3B0aW9ucy5jb2RlbmFtZSBvciBvcHRpb25zLnJlbGVh
c2UpCgogICAgZGlzdGluZm8gPSBsc2JfcmVsZWFzZS5nZXRfZGlzdHJvX2luZm9ybWF0aW9uKCkK
CiAgICBpZiBub25lIG9yIG9wdGlvbnMuYWxsIG9yIG9wdGlvbnMudmVyc2lvbjoKICAgICAgICB2
ZXJpbmZvID0gbHNiX3JlbGVhc2UuY2hlY2tfbW9kdWxlc19pbnN0YWxsZWQoKQogICAgICAgIGlm
IG5vdCB2ZXJpbmZvOgogICAgICAgICAgICBwcmludCgiTm8gTFNCIG1vZHVsZXMgYXJlIGF2YWls
YWJsZS4iLCBmaWxlPXN5cy5zdGRlcnIpCiAgICAgICAgZWxpZiBzaG9ydDoKICAgICAgICAgICAg
cHJpbnQoJzonLmpvaW4odmVyaW5mbykpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgcHJpbnQo
J0xTQiBWZXJzaW9uOlx0JyArICc6Jy5qb2luKHZlcmluZm8pKQoKICAgIGlmIG9wdGlvbnMuaWQg
b3Igb3B0aW9ucy5hbGw6CiAgICAgICAgaWYgc2hvcnQ6CiAgICAgICAgICAgIHByaW50KGRpc3Rp
bmZvLmdldCgnSUQnLCAnbi9hJykpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgcHJpbnQoJ0Rp
c3RyaWJ1dG9yIElEOlx0JXMnICUgZGlzdGluZm8uZ2V0KCdJRCcsICduL2EnKSkKCiAgICBpZiBv
cHRpb25zLmRlc2NyaXB0aW9uIG9yIG9wdGlvbnMuYWxsOgogICAgICAgIGlmIHNob3J0OgogICAg
ICAgICAgICBwcmludChkaXN0aW5mby5nZXQoJ0RFU0NSSVBUSU9OJywgJ24vYScpKQogICAgICAg
IGVsc2U6CiAgICAgICAgICAgIHByaW50KCdEZXNjcmlwdGlvbjpcdCVzJyAlIGRpc3RpbmZvLmdl
dCgnREVTQ1JJUFRJT04nLCAnbi9hJykpCgogICAgaWYgb3B0aW9ucy5yZWxlYXNlIG9yIG9wdGlv
bnMuYWxsOgogICAgICAgIGlmIHNob3J0OgogICAgICAgICAgICBwcmludChkaXN0aW5mby5nZXQo
J1JFTEVBU0UnLCAnbi9hJykpCiAgICAgICAgZWxzZToKICAgICAgICAgICAgcHJpbnQoJ1JlbGVh
c2U6XHQlcycgJSBkaXN0aW5mby5nZXQoJ1JFTEVBU0UnLCAnbi9hJykpCgogICAgaWYgb3B0aW9u
cy5jb2RlbmFtZSBvciBvcHRpb25zLmFsbDoKICAgICAgICBpZiBzaG9ydDoKICAgICAgICAgICAg
cHJpbnQoZGlzdGluZm8uZ2V0KCdDT0RFTkFNRScsICduL2EnKSkKICAgICAgICBlbHNlOgogICAg
ICAgICAgICBwcmludCgnQ29kZW5hbWU6XHQlcycgJSBkaXN0aW5mby5nZXQoJ0NPREVOQU1FJywg
J24vYScpKQoKaWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzoKICAgIG1haW4oKQo=
--00000000000054fbdd05eaf1c17b
Content-Type: application/octet-stream; name="lsb_release-12.0"
Content-Disposition: attachment; filename="lsb_release-12.0"
Content-Transfer-Encoding: base64
Content-ID: <f_l97li3xj1>
X-Attachment-Id: f_l97li3xj1

IyEvYmluL3NoCgojIFNQRFgtRmlsZUNvcHlyaWdodFRleHQ6IDIwMjEtMjAyMiBHaW9lbGUgQmFy
YWJ1Y2NpCiMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IElTQwoKc2V0IC1ldQoKZXhwb3J0IExD
X0FMTD0iQy5VVEYtOCIKCmhlbHAgKCkgewoJY2F0IDw8LUVPRAoJCVVzYWdlOiBsc2JfcmVsZWFz
ZSBbb3B0aW9uc10KCgkJT3B0aW9uczoKCQkgIC1oLCAtLWhlbHAgICAgICAgICBzaG93IHRoaXMg
aGVscCBtZXNzYWdlIGFuZCBleGl0CgkJICAtdiwgLS12ZXJzaW9uICAgICAgc2hvdyBMU0IgbW9k
dWxlcyB0aGlzIHN5c3RlbSBzdXBwb3J0cwoJCSAgLWksIC0taWQgICAgICAgICAgIHNob3cgZGlz
dHJpYnV0b3IgSUQKCQkgIC1kLCAtLWRlc2NyaXB0aW9uICBzaG93IGRlc2NyaXB0aW9uIG9mIHRo
aXMgZGlzdHJpYnV0aW9uCgkJICAtciwgLS1yZWxlYXNlICAgICAgc2hvdyByZWxlYXNlIG51bWJl
ciBvZiB0aGlzIGRpc3RyaWJ1dGlvbgoJCSAgLWMsIC0tY29kZW5hbWUgICAgIHNob3cgY29kZSBu
YW1lIG9mIHRoaXMgZGlzdHJpYnV0aW9uCgkJICAtYSwgLS1hbGwgICAgICAgICAgc2hvdyBhbGwg
b2YgdGhlIGFib3ZlIGluZm9ybWF0aW9uCgkJICAtcywgLS1zaG9ydCAgICAgICAgc2hvdyByZXF1
ZXN0ZWQgaW5mb3JtYXRpb24gaW4gc2hvcnQgZm9ybWF0CglFT0QKCWV4aXQKfQoKc2hvd19pZD1m
YWxzZQpzaG93X2Rlc2M9ZmFsc2UKc2hvd19yZWxlYXNlPWZhbHNlCnNob3dfY29kZW5hbWU9ZmFs
c2UKc2hvcnRfZm9ybWF0PWZhbHNlCgpvcHRpb25zPSQoZ2V0b3B0IC0tbmFtZSBsc2JfcmVsZWFz
ZSAtbyBodmlkcmNhcyAtbCBoZWxwLHZlcnNpb24saWQsZGVzY3JpcHRpb24scmVsZWFzZSxjb2Rl
bmFtZSxhbGwsc2hvcnQgLS0gIiRAIikgfHwgZXhpdCAyCmV2YWwgc2V0IC0tICIkb3B0aW9ucyIK
d2hpbGUgWyAkIyAtZ3QgMCBdIDsgZG8KCWNhc2UgIiQxIiBpbgoJCS1ofC0taGVscCkgaGVscCA7
OwoJCS12fC0tdmVyc2lvbikgOzsKCQktaXwtLWlkKSBzaG93X2lkPXRydWUgOzsKCQktZHwtLWRl
c2NyaXB0aW9uKSBzaG93X2Rlc2M9dHJ1ZSA7OwoJCS1yfC0tcmVsZWFzZSkgc2hvd19yZWxlYXNl
PXRydWUgOzsKCQktY3wtLWNvZGVuYW1lKSBzaG93X2NvZGVuYW1lPXRydWUgOzsKCQktYXwtLWFs
bCkgc2hvd19pZD10cnVlIDsgc2hvd19kZXNjPXRydWUgOyBzaG93X3JlbGVhc2U9dHJ1ZSA7IHNo
b3dfY29kZW5hbWU9dHJ1ZSA7OwoJCS1zfC0tc2hvcnQpIHNob3J0X2Zvcm1hdD10cnVlIDs7CgkJ
KikgYnJlYWsgIDs7Cgllc2FjCglzaGlmdApkb25lCgpkaXNwbGF5X2xpbmUgKCkgewoJbGFiZWw9
IiQxIgoJdmFsdWU9IiQyIgoKCWlmICRzaG9ydF9mb3JtYXQgOyB0aGVuCgkJcHJpbnRmICIlc1xu
IiAiJHZhbHVlIgoJZWxzZQoJCXByaW50ZiAiJXM6XHQlc1xuIiAiJGxhYmVsIiAiJHZhbHVlIgoJ
ZmkKfQoKIyBMb2FkIHJlbGVhc2UgaW5mbyBmcm9tIHN0YW5kYXJkIGlkZW50aWZpY2F0aW9uIGRh
dGEgZmlsZXMKWyAtZiAvdXNyL2xpYi9vcy1yZWxlYXNlIF0gJiYgb3NfcmVsZWFzZT0vdXNyL2xp
Yi9vcy1yZWxlYXNlClsgLWYgL2V0Yy9vcy1yZWxlYXNlIF0gJiYgb3NfcmVsZWFzZT0vZXRjL29z
LXJlbGVhc2UKWyAiJHtMU0JfT1NfUkVMRUFTRS14fSIgIT0gIngiIF0gJiYgWyAtZiAiJExTQl9P
U19SRUxFQVNFIiBdICYmIG9zX3JlbGVhc2U9IiRMU0JfT1NfUkVMRUFTRSIKWyAiJHtvc19yZWxl
YXNlLXh9IiAhPSAieCIgXSAmJiAuICIkb3NfcmVsZWFzZSIKCiMgTWltaWMgdGhlIG91dHB1dCBv
ZiBEZWJpYW4ncyBQeXRob24tYmFzZWQgbHNiX3JlbGVhc2UKIyBDYXBpdGFsaXplIElECjogIiR7
SUQ9fSIKSUQ9IiQocHJpbnRmICIlcyIgIiRJRCIgfCBjdXQgLWMxIHwgdHIgJ1s6bG93ZXI6XScg
J1s6dXBwZXI6XScpJChwcmludGYgIiVzIiAiJElEIiB8IGN1dCAtYzItKSIKIyBVc2UgTkFNRSBp
ZiBzZXQgYW5kIGRpZmZlcmVudCBmcm9tIElEIG9ubHkgaW4gY2FwaXRhbGl6YXRpb24uCmlmIFsg
IiR7TkFNRS14fSIgIT0gIngiIF0gOyB0aGVuCglsb3dlcl9jYXNlX2lkPSQocHJpbnRmICIlcyIg
IiRJRCIgfCB0ciAnWzp1cHBlcjpdJyAnWzpsb3dlcjpdJykKCWxvd2VyX2Nhc2VfbmFtZT0kKHBy
aW50ZiAiJXMiICIkTkFNRSIgfCB0ciAnWzp1cHBlcjpdJyAgJ1s6bG93ZXI6XScpCglpZiBbICIk
e2xvd2VyX2Nhc2VfaWR9IiA9ICIke2xvd2VyX2Nhc2VfbmFtZX0iIF0gOyB0aGVuCgkJSUQ9IiRO
QU1FIgoJZmkKZmkKCiMgR2VuZXJhdGUgbWluaW1hbCBzdGFuZGFyZC1jb25mb3JtIG91dHB1dCAo
aWYgc3Rkb3V0IGlzIGEgVFRZKS4KWyAtdCAxIF0gJiYgZWNobyAiTm8gTFNCIG1vZHVsZXMgYXJl
IGF2YWlsYWJsZS4iID4mIDIKCmlmICRzaG93X2lkIDsgdGhlbgoJZGlzcGxheV9saW5lICJEaXN0
cmlidXRvciBJRCIgIiR7SUQ6LW4vYX0iCmZpCgppZiAkc2hvd19kZXNjIDsgdGhlbgoJZGlzcGxh
eV9saW5lICJEZXNjcmlwdGlvbiIgIiR7UFJFVFRZX05BTUU6LW4vYX0iCmZpCgppZiAkc2hvd19y
ZWxlYXNlIDsgdGhlbgoJZGlzcGxheV9saW5lICJSZWxlYXNlIiAiJHtWRVJTSU9OX0lEOi1uL2F9
IgpmaQoKaWYgJHNob3dfY29kZW5hbWUgOyB0aGVuCglkaXNwbGF5X2xpbmUgIkNvZGVuYW1lIiAi
JHtWRVJTSU9OX0NPREVOQU1FOi1uL2F9IgpmaQo=
--00000000000054fbdd05eaf1c17b--
