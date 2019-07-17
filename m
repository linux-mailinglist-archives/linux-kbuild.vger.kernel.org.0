Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C876BF2B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 17:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfGQPbB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 11:31:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45958 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfGQPbB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 11:31:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so25278331wre.12;
        Wed, 17 Jul 2019 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=lp9LaovzP897q8rJ2Yj+FnynKyErmgF+4dB6/5fv4Qc=;
        b=cQBsCkXHEbz/p+7To9YvkAomNZXA+0rNFFlP1doS7rmcIw5JTbovEamNB84rUbwyeS
         W05zL2tInijJOXZC+d3l5Bh/ih2vZWfz/xKsnTlqDahDzDoK10Us74oV71wrvkEF0zDW
         336+9Tk7I3WqdQNqVAlwd57DLNpsGhqW7mcx375IKs6WeYDojUK0YHZitITwrC9tMqHw
         c2ni9cBowAqaKArKkO8jcdwzkO0B1lOe7tWJLD463kyKM961HM/TcLMjDmPszRpBLbOi
         S+jU3sXvL1qptIZ2GOKYhyuAu8JCAUm1Is/viML4UZ/+RcWGCL1dp/i7xXh5bcrcoAxr
         k4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=lp9LaovzP897q8rJ2Yj+FnynKyErmgF+4dB6/5fv4Qc=;
        b=M8nC9g2XFIOom5/LQ1XsGHc0L70X4AY+vSjw72Dz7cTjjmNi+rWMTxGkiuOeJpHOkm
         D7+fdrZws1H71NMUTMvG6Kw8TcHfPbd9nJyPLwh/JdJUmNTfVkpsgTXdSXhBefSyMjEo
         c7AXJf0WIEnTvxHpygj3ZiKhLG3yh5ndqyDB+UjMDGvbNif3xnqkQlEdL5rz3SSFknxs
         Bbb1SEkRvjAQCaCB73EzyrDxrc+9rqbZHQ0w9SqacCci8jb5cb75p4biWOocoT7IVXNF
         9PkEokRN08QilzCh7/RpoqMkuLnhF/UfaTz02lJUmHplpDz2eDZbFkDFnj8uLl+R7MDc
         dEiQ==
X-Gm-Message-State: APjAAAXn58ywHHRB0r+nOUh9ZDupnn2HKna85rs3y7WD2Es9wmupvvw9
        c88yT8GdqRJYfZRFRVnEvpUleDkSi2S+sm5oLXE=
X-Google-Smtp-Source: APXvYqzYeK8zm6fB6RbtMRqyt4P012ELpdexhrmS+06mNC/hM+fmWO/+wj8CgMoax1sy0qPdnZacR0b4gMWxeqQ8Qlo=
X-Received: by 2002:a5d:498f:: with SMTP id r15mr41131590wrq.353.1563377458447;
 Wed, 17 Jul 2019 08:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190717142922.214d54ec@canb.auug.org.au>
In-Reply-To: <20190717142922.214d54ec@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 17 Jul 2019 17:30:47 +0200
Message-ID: <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 17
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Steven, Hi Darrick,

Unfortunately, my build-script is not working anymore.

I am using builddeb/mkdebian scripts.

[ BUILD-LOG ]
...
set -e; mkdir -p include/config/; { echo "5.2.0$(/bin/bash
./scripts/setlocalversion .)"; } > include/config/kernel.release.tmp;
if [ -r include/config/kernel.release ] && cmp -s
include/config/kernel.release include/config/kernel.release.tmp; then
rm -f include/config/kernel.release.tmp; else : '  UPD
include/config/kernel.release'; mv -f
include/config/kernel.release.tmp include/config/kernel.release; fi
make -f ./scripts/Makefile.build obj=3Dscripts/package bindeb-pkg
/bin/bash ./scripts/package/mkdebian
./scripts/package/mkdebian: line 149: cd: source/: No such file or director=
y
make[1]: *** [scripts/package/Makefile:79: bindeb-pkg] Error 1
make: *** [Makefile:1442: bindeb-pkg] Error 2

Investigations revealed hardcoded stuff from the ...

Merge remote-tracking branch 'iomap/iomap-for-next'

$ git blame scripts/package/mkdebian | grep 'cd source'
87bdff62e470c (Darrick J. Wong    2019-06-27 17:30:15 -0700 149) (cd
source/ ; stg ser | sed -e '/^-/d' -e 's/^. /  * /g') >>
debian/changelog

$ git log --oneline --author=3D"Darrick J. Wong" scripts/package/mkdebian
87bdff62e470 mtr: Build script adjustments

I do not think this was intended?

Reverting seems to be easy and fix it for me.

$ git revert --no-edit 87bdff62e470
F=C3=BChre Erkennung f=C3=BCr ungenaue Umbenennung aus: 100% (2251440/22514=
40), Fertig.
[5.2.0-3-amd64-cbl-asmgoto db8ec1968620] Revert "mtr: Build script adjustme=
nts"
 Date: Wed Jul 17 17:27:26 2019 +0200
 3 files changed, 10 insertions(+), 17 deletions(-)

Please make it work again for $WORLD.

Thanks.

Regards,
- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log=
/scripts/package/mkdebian?h=3Dnext-20190717
