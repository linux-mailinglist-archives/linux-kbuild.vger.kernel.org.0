Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2F029F357
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 18:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgJ2RfK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 13:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgJ2RfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 13:35:10 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F48C0613D6
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2020 10:35:10 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id x7so3878500ili.5
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2020 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XgWRfTC5mozW9G8fjC2+3Ww/uC2rVksFRx+oiDVdNpY=;
        b=KAeclnGgXv2bd2/LIt9+N6sxmedF2kGzszIn/uA48/B3c50gOdtu6VKUuvI5mlCeHi
         WnWuuR/iC4vATe8ACggFzljAivSqj1g1PEJteT6j97ZYBnJec+6ZV13+tCcE45FAY1W/
         jgJD9QhuZyhf6MGBniu1y/TwM8hhF51VVw5JoMedJiucJ/Uzits6ixrADj/Ca/BNbYll
         koJecGU6LGdszrhE7pSQi8WbCSlDdTx++lkDLy8q40l8KKdMSuC6MdXtMF29O5vBjiVI
         qguygIBz+HnaR6/fb+1R612mvuShAsaEd/J7nnDq4hjGy8kb2oALSrbYwcrDlD5AzUf0
         caZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XgWRfTC5mozW9G8fjC2+3Ww/uC2rVksFRx+oiDVdNpY=;
        b=rLIWUAIjkU1UndV31i4ajs3SlZTqTCbU0wtdHbF8gA7EhWRsmuYDwcYu2nzbd6Pzsu
         TptHSSDaRrbRD5UZbXrNF7m3CN51VZLROEyRJoDUMV0R8wX7a/ORZyBTcstWtPKK8VIB
         xyKnlUVKyz05eOuh/Rhoa8LVH+xxECRX9wjNGR0jbmMqyOIbqe7CUj6BXVeilPCm7uvg
         kQvMLVxwNMH0wsNF3En3kwQ/tG06d2OGWZdqHIY+O3JJLBdhniGYZQf94ZgRFeuFjpaZ
         dVo5xh2uSB/EiqzDIIWDaef2gLurQUNehHk7DToDRGG5Y4t2QR3mPxVd0s1zMbms3r4w
         riIQ==
X-Gm-Message-State: AOAM532PueRCcweUxBJUtIRvpZ1xu1O8xRqQXt+4w5CmMYcxdT4jNgfl
        C85qw4of9B5rhMEXYlthsZgcZ5xEQpQk3g2rZ6XerADMpQsTiA==
X-Google-Smtp-Source: ABdhPJxzHysWgOSa+ciWcO/z7O7VOOYATiKOcCviXa7Nue2nEj6Zu34I85C0iIetfTyvPu6YmW7zKVWswNwpdn6tvB8=
X-Received: by 2002:a92:c94c:: with SMTP id i12mr4121744ilq.145.1603992908692;
 Thu, 29 Oct 2020 10:35:08 -0700 (PDT)
MIME-Version: 1.0
From:   Anatol Pomozov <anatol.pomozov@gmail.com>
Date:   Thu, 29 Oct 2020 10:34:57 -0700
Message-ID: <CAOMFOmUUJ4C95J3psPBgfaFX=VCqAZEcRrf2Y0pzR+C=xxNMyg@mail.gmail.com>
Subject: "Permission denied" when using system-installed kernel headers
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi folks

Here is a follow-up for this issue
https://github.com/Open-CAS/open-cas-linux/issues/540

opencas project builds an out-of-tree kernel module and uses
system-level kernel header. In my case these headers are installed to
/lib/modules/5.9.1-arch1-1/build

So if I do

$ cd /lib/modules/5.9.1-arch1-1/build
$ make kernelversion

I get following output:

mkdir: cannot create directory =E2=80=98.tmp_86541=E2=80=99: Permission den=
ied
mkdir: cannot create directory =E2=80=98.tmp_86543=E2=80=99: Permission den=
ied
mkdir: cannot create directory =E2=80=98.tmp_86545=E2=80=99: Permission den=
ied
mkdir: cannot create directory =E2=80=98.tmp_86547=E2=80=99: Permission den=
ied
.......
mkdir: cannot create directory =E2=80=98.tmp_86626=E2=80=99: Permission den=
ied
mkdir: cannot create directory =E2=80=98.tmp_86628=E2=80=99: Permission den=
ied
mkdir: cannot create directory =E2=80=98.tmp_86630=E2=80=99: Permission den=
ied
5.9.1-arch1


Quick debugging shows that it comes from scripts/Kbuild.include
following lines in particular:

# output directory for tests below
TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$

# try-run
# Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
# Exit code chooses option. "$$TMP" serves as a temporary file and is
# automatically cleaned up.
try-run =3D $(shell set -e; \
TMP=3D$(TMPOUT)/tmp; \
TMPO=3D$(TMPOUT)/tmp.o; \
mkdir -p $(TMPOUT); \
trap "rm -rf $(TMPOUT)" EXIT; \
if ($(1)) >/dev/null 2>&1; \
then echo "$(2)"; \
else echo "$(3)"; \
fi)



TMPOUT points to headers directory and in my case it is a part of /usr
partition that restricts user writes.


TMPOUT should avoid writing to headers dir and use `mktemp` instead.
