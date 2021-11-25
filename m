Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5163345DE97
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Nov 2021 17:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhKYQ0z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Nov 2021 11:26:55 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63099 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbhKYQYy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Nov 2021 11:24:54 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211125162142euoutp01fe7dff96aaadda9137f35fa6733f2627~61onZhb1R2063920639euoutp01D
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Nov 2021 16:21:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211125162142euoutp01fe7dff96aaadda9137f35fa6733f2627~61onZhb1R2063920639euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637857302;
        bh=E56KINwcJaJWD0b7KZk2YjPG+prT8IwamA6iLmOBNZs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=eS6Jebj7dLe739QNxJZqOkmzLGa08V39xTZSws/nukf994axlRUTXl2MAaGYMw/ta
         OS6g3RIQJvrx1Op7zj6DLO8R2PisQ7uRjXRaqYDloG+/VohTHmwH3m81L5mQACZHjU
         d8YoGYJX62HQgWj+N3jxznehSGDNsdsnjaNCCAps=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211125162141eucas1p186b234e4d3299583bbce1f28acd369f8~61om0mMvc3041330413eucas1p17;
        Thu, 25 Nov 2021 16:21:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.FF.10260.518BF916; Thu, 25
        Nov 2021 16:21:41 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211125162141eucas1p288a33941afc09ce74bd59368495c8581~61omdCCbu2868228682eucas1p2N;
        Thu, 25 Nov 2021 16:21:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211125162141eusmtrp1dc6666b40ea51ccebc16c795edd7fbff~61omb08HU0630206302eusmtrp1N;
        Thu, 25 Nov 2021 16:21:41 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-b2-619fb81563ed
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F0.7C.09404.418BF916; Thu, 25
        Nov 2021 16:21:40 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211125162140eusmtip19d9c3d57bd9319d5ae9c31fc98734a99~61omSNDUb1770817708eusmtip1e;
        Thu, 25 Nov 2021 16:21:40 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] streamline_config.pl: show the full Kconfig name
Date:   Thu, 25 Nov 2021 17:20:54 +0100
Message-Id: <20211125162055.3583991-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
X-Developer-Signature: v=1; a=openpgp-sha256; l=746;
        i=l.stelmach@samsung.com; h=from:subject;
        bh=miFX6uUFc+6RBx/jw8/b9IDeEKjHrGiRMZXpsqew9UQ=;
        b=owEBbQGS/pANAwAIAbCuHpyYpYAQAcsmYgBhn7fmkbDcGMBxWShZRsOCB4BS/GJG+0gmHhx3piy6
        fL98LqGJATMEAAEIAB0WIQRem7KqOr2QYRWv1RCwrh6cmKWAEAUCYZ+35gAKCRCwrh6cmKWAEPCSCA
        CegdFHh41MlgYoSGeBo7TyJo5AjLf+fe04mUkm7tRPoCbwddVNLBBCnkXZEV3QSkhHrubM181S3vlZ
        OjpFFZOa/N8mUNHi3zeiVc0NKx4snGKw9Qea/r4gdiSUcHz6FjxUEyhT9Vw8y2N3r5s72mSnePhwnR
        CJ/BPMG3z8u80Fw4clrZiVgCYLSmH2TMzmwG53PubA9p7nT5MlYYGFkdF/2yAcNtgJrCuLmJX6cEWB
        MDE2d8Rz7YoikAkSLPyLAkvZCIlY7zkJFuZ6x6gBPzAXViv0GC5cD9OMY0NgMKq1VvD+WDrTDgRnm+
        eooAZ5az78qqY/vuvlgzo+CSCS1oLm
X-Developer-Key: i=l.stelmach@samsung.com; a=openpgp;
        fpr=A2B9843766B15A4D32BCBF0DEC1B3A02E80CD5C8
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWy7djP87qiO+YnGkzeKWBx89AKRos/u3Yw
        WVzeNYfNYu2Ru+wWDx/cYHVg9di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDIWH5nL
        WPCGtWLrrOAGxmcsXYycHBICJhL9N58ydzFycQgJrGCU+HvgFQuE84VRYvnlRYwgVUICnxkl
        7s5OhOk4dLWPDaJoOaPExw/H2CGc54wSk77dYAapYhNwlOhfeoIVxBYR0JK4s7SDFaSIWWAN
        o8Tl/utMIAlhoKKLz2+CrWARUJU4MW0D2FG8ArYSB36tZYVYJy/Rdn06I0RcUOLkzCdgNfxA
        Q9c0XQe7VUJgFqvE/66lzBANKRIPL7eCNTADNTdvnc0MUXSAQ2LCh/dsEEUuElNOdbBD2MIS
        r45vgbJlJE5P7gGaygFk10tMnmQG0dvDKLFtzg9okFlL3Dn3iw2khllAU2L9Ln2IsKPElHsv
        2SBa+SRuvBWEOIFPYtK26cwQYV6JjjYhiGoViXX9e1gmMCrPQvLZLCRHz0KYv4CReRWjeGpp
        cW56arFxXmq5XnFibnFpXrpecn7uJkZgCjn97/jXHYwrXn3UO8TIxMF4iFGCg1lJhNc5cH6i
        EG9KYmVValF+fFFpTmrxIUZpDhYlcV6RPw2JQgLpiSWp2ampBalFMFkmDk6pBqbZhkL6F3cl
        HepT5FxoXb7y9Qk9669Fx5pDzqvefOR1TeuAxewFGY9YYqoTev+lbFSr9lseuWe3qeQzqdXb
        3bwKrpzbsTiAPdl7jV2AOOuBGf8WeV9N2B7vUBgR83Se6VTeyZy6v1q8t/nWxN8u/Pj6olJC
        Su0V5sjVPnEls+31ex10fvVvWr4m8xnX/MPiTCys9RG3D739Zskc8n1a2pYb7Lu32tgxlIpm
        qudKtLVG7pofP6PiRkvV7HOfCvXDOYvipzB6Wlz+4Tnvn9XeSMeDdr6Zmdoxy2Sn6l54EvHD
        /NpkbU22BZ/rLn45rx69Stfy/bXIP/tO7Jqu4pi4K+PX55MneLbsXPTiXEBe8RclluKMREMt
        5qLiRAC1NxE3kAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4XV2RHfMTDZqWmVrcPLSC0eLPrh1M
        Fpd3zWGzWHvkLrvFwwc3WB1YPTat6mTz6NuyitHj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzFR+YyFrxhrdg6K7iB8RlLFyMnh4SA
        icShq31sXYxcHEICSxkl9pxuYu9i5ABKSEmsnJsOUSMs8edaFxuILSTwlFHi+vNkEJtNwFGi
        f+kJVhBbREBL4s7SDlaQOcwC6xgl5k79yQ6SEAYquvj8JiOIzSKgKnFi2gawxbwCthIHfq1l
        hVggL9F2fTojRFxQ4uTMJywgNzALqEusnycEEuYHmr+m6ToLyHwJgQ5WiafPDzJC9CZJHFi/
        DsxmBprTvHU28wRGoVlIRs1CGDULSdUCRuZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgfGy
        7djPLTsYV776qHeIkYmD8RCjBAezkgivc+D8RCHelMTKqtSi/Pii0pzU4kOMpkCvTWSWEk3O
        B0ZsXkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDU45Vz57V27c0
        /d+0+01X7MKPa6RNzM5NedRYuG5655r0kn+WK52n3oyZk/R3mriSrNnvJZHtzfuDdx+4KZQx
        Y5m5UpRw2FGRdhfzPo/nzx/HlHcc2SSfK/nt7aX5j3x5PKyadmvbxDp//OaTVlWQZ+rBlWW0
        ZLbkO83n51fKlLMLF5anXzw6Z16MtVWDlubxj6XTHxiH3fp5bHXB73f/rOz6BD6+q1uzZvn8
        oAWVB/1NbILZL+quzHe5P3/mvFrDe+3nePwfrvox49wh180bXfcn+p1MzV6o3LJ1cYJUlZJ+
        WdXlOx7HDs28dPX/71SuNuF2qZtBcz+s4Djb0LVPRfqQdmxjHBevtZdUl9lKQSWW4oxEQy3m
        ouJEALDuwEsgAwAA
X-CMS-MailID: 20211125162141eucas1p288a33941afc09ce74bd59368495c8581
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211125162141eucas1p288a33941afc09ce74bd59368495c8581
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211125162141eucas1p288a33941afc09ce74bd59368495c8581
References: <CGME20211125162141eucas1p288a33941afc09ce74bd59368495c8581@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Show the very same file name that was passed to open()
in case the operation failed.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 1a5fea0519eb..3387ad7508f7 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -170,7 +170,7 @@ sub read_kconfig {
 	$source =~ s/\$\($env\)/$ENV{$env}/;
     }
 
-    open(my $kinfile, '<', $source) || die "Can't open $kconfig";
+    open(my $kinfile, '<', $source) || die "Can't open $source";
     while (<$kinfile>) {
 	chomp;
 
-- 
2.30.2

