Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802CC45C8AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Nov 2021 16:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239618AbhKXPeA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Nov 2021 10:34:00 -0500
Received: from sonic310-21.consmr.mail.gq1.yahoo.com ([98.137.69.147]:38589
        "EHLO sonic310-21.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238586AbhKXPd7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Nov 2021 10:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1637767849; bh=sZfrWG5Xvk1chzVi4S16DUIyfYrQAOBdWOyCjDnxAs8=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=I5Z7WOXDusts6iVDUN8wxnh2N0zM4DHk0f5EcG6aNH957XxwtolvQ8KkMC7z7szTzV0j49+6SLRgFLRMCNV9Yor+StDnZg4HGlbiJuBwOnAc+ameVxAiqvKSNqdeoJ3KLFmOOQp4iT3s7wyxjQzCykLrV7FcbICkrUzYgaCp9pxb/eN6ddcNvRCQynIabIks0judljqNLDoNKtZ6wAXHB4KXH2+FCRGG+C7wb962T/u0EZtWUah2wP+IBtYUD2OLmcdQKe9+nNBNsuhoXzhutgfpsr0JFCqd09CZ91bdlvjGq2KrwXk2YZWTr+VNeTXDIzIN3w6BejAi4mW6nCZAbA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1637767849; bh=2MLcPnpndP6JxWngdhJ2fz3QQCi0VBWOA3SQ1tdekOY=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BUS+imbxef+7ojjgeyVjo74ec2dPgrOMIdA6FZPW1YET5K/D6fXB88Iw2Vqf89qbTl1lqOlPClhNRp5X3H5/O+3n9auY+Pj5ntUDdc6S9fZY4Eyi+UkrBV+SFn0Ept5G0d1NPK5JpR6ny87iNmVnwMGfbOP5IKCanz4dZge7J38od1HzVaijguGuxLvSEuE4WNjbyy+NDBiCz+MeEZhoDgwbjePxTP7r+vw1663JqdhGX7/YjOcMM3b8woAto+DV27tXKUJ/P65rlreBDkxGNblztAwNDgasoDV+P8hgJVtMgNE8j+1Plx/dxHaYH5828iaRppGwCkxuC4+9LC5auQ==
X-YMail-OSG: LmQt4OMVM1m.3BUvGeFKMDq40CX9uy8DvVOtveKQG5e7D9s_LuApCOb54XUCbmT
 m1jDkLyKOoID3UFe05VYKqKyYapOwiqHltUCS_AL_28NBGN9NXXM.Kpn27uu1.6xedQU3fUktefU
 zWz5e1yCmLJnQ1jwQpCc3BCr2nNlMp_hwrMKUADN8U3J.JwlsNoGkl5L9uv6Am95mdc2momjaPUD
 01nRSaHWiqSSSGY1rnsPrGxNyPpzLU3wvVSs0txky16LpxIpOjR5l4f1NxVa0hzWNhsYQEn5Aptt
 pInmcWWIe7kwQJZMzWU23A5pBx2TdOv77BIABb6DUQrvciKq1cgkDuo.pLhvap0sXbbh_BidchH_
 vtWoccQJu1MBNMIemF_kpUgXnlPJeS_RYTvTDa7N1OawllYrUK8mNF.gMnq0_hs_O8z98rJKPT3q
 BLUD_U0A79x.ZF3FxlS35OYHVZ0r4EkJtC.aQNiIm2p5kdk02EnzTmYF5o0b_4uPWKGLXBV4u.YV
 q1aF.qqBmhP8Jmd3Dupp6VzGcqp7qBe_eG7VPTbEWzNO6Ve7dmtzpArxCQdjZrtsBPN0W4k_YHiL
 NBAhFL2etUAmRgcvKZWZxekDZ5EUpvBrcz1hwv39uJahAzUMdAZUkpf1DpXn1qjPYhEINbyAgtOV
 mD2zBfSicPRVn3dAgxdFowcl7NRML2IyS.ZorYi5.HNLie1Xb0Cxy6E0EhGOVnBy9k2LPUkYzI60
 wHa7Fug9qetMzcQ30.IvC5Ou56og6Tzvj1GUFFnOidjosI9shCuXL2w6EeN5O0PMRC_Jehcxt88O
 LJAWTclHQTKH7LygxaO3YZz40CuTpsBBxh6ot9AfXe.qOsWfwinBHk7ChktAO4G55kV21ytdzV8Q
 LV8ICQCP6qxCNUhfkEpCzoxG09CTdA2tqozsUJOTMEkiuWb8xv1H05W3hM82XZ77JB975X0CvoJv
 obAxLXJtJRHHsgUOh_r.Gx245FVDJns_OOHzSHhmFxDVA3PKNfwLSoRZB42pdwrjAI3RKvmpnt5p
 kTXelyQB8dmH_dmGxuMZ4jClVuhUE8LpvGCQAnoINAVAOPkojWixKdw_CHsAWWNHuH6sjPswvfPl
 POZFy6n1m40ydgTgA15JVIXLhnnTbv3x.eg3bWyaEupykkUuYCmQyKOew1n_0y6i1U09Z3qrLj7P
 pIEtExjyjp03wf22FYUlXA8UZH9PCV9p1wHVZ.VDWyhCNRnsO1rX34Nqb9IdFgF8aIKRHLyqt7AX
 D.wFlXGa905xNvG8dkzY0YE9Oe0pv8ezQWJzQSwIsw8p6zzXDlW87zHkiXUeiRy1hvefxTJ3QWLV
 7yCEgxx0FeyfiPwULbHYFaVoSvTxzPxf4p4a_A9lB7ZfO0wmYSX9j3gUU7.6KNJ1LFqoUFAn_GEG
 GgwOdmosa51vzaPr7mT.gphGOegmPFyc8P.LQyG4Eaa9rXWNGKyTmPoemlwsyY72EMPPiksqyLvJ
 2HWf70keBVnyIwHekrIg96bBKsNgXRHf.dGmfH8VtbKQ0.9X6d4c7EIcBdwSyzr9bKFKIHwtvJ34
 O9mCpKRqtqW_6zR0WIxgb.nxEo.EIQhHWN5Ligv6xUouKd70ffAYbRr0e7YshahZBsoa17qoA1bz
 JV1fUMkGHsm8C0La.3FtV.wE8ub80pa97Hn5GrAnSk8S.OglKDeX7_8U_KtJR568A1PNDRk2Jc6N
 Ng6xPcPU9EuyRtkq.EDTD5co6KVQ3qdxA5pEXAakpBkUCfA0nR6d7UFgw8Xe8fkg4ffbhkt.M5bR
 tTJHfi.Xaf_Y4ihvhIeoAS_EE7MewUZpCNlJYq6SKVQZxyldjcowAwWmFsQFPYLSFEEGUWehTPo7
 JrC.KmmIx.ITwxpfA5JGX7dvG2g_uokMmfffToGx8gZjYH6prZa1V6PrYvizQCV.jL2Xv1LGWheR
 qYKJ3FPKBddc1g.WThejQNoMV9I3.olpOGoVQAdTlHxPsIJcqhKJVwfaYCkClXAjZrG0dfDDbaXC
 8Rf052pMC8xuI94vU6DbqUx.5VODycTB922x0kil8Hv6KCYd7vPWROepYbUH.0SQwkUgST0kE2Uc
 rW9IDkTYr3Q2PCrSdFeyIReNtWmyajwMVe056iBCXe9q.wQTtUYhqQ6qpCsybghhepXbNpRovDCG
 C9JVy0sh_2wQXiqul2ji.yxTgJgUqEY0gITSgOlyoJKNnGb4PTBAqeXdF0Z9qSJznbUn6CfGwE58
 8w1AXIDxc1.G5j.1irPRplK0wG51DpaZN3bHoBE9YmfciUmgbITti6BnxvRwU9hZOiatAXxpkLHg
 fXYlB4qY-
X-Sonic-MF: <alex_y_xu@yahoo.ca>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Wed, 24 Nov 2021 15:30:49 +0000
Received: by kubenode520.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID a9ce41034f328ae2261d33f37437d315;
          Wed, 24 Nov 2021 15:30:46 +0000 (UTC)
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To:     Michael Forney <forney@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>, Ingo Molnar <mingo@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: [PATCH v2 2/2] kbuild: pass --stream-size --no-content-size to zstd
Date:   Wed, 24 Nov 2021 10:31:05 -0500
Message-Id: <20211124153105.155739-2-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124153105.155739-1-alex_y_xu@yahoo.ca>
References: <20211124153105.155739-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Otherwise, it allocates 2 GB of memory at once. Even though the majority
of this memory is never touched, the default heuristic overcommit
refuses this request if less than 2 GB of RAM+swap is currently
available. This results in "zstd: error 11 : Allocation error : not
enough memory" and the kernel failing to build.

When the size is specified, zstd will reduce the memory request
appropriately. For typical kernel sizes of ~32 MB, the largest mmap
request will be reduced to 512 MB, which will succeed on all but the
smallest devices.

For inputs around this size, --stream-size --no-content-size may
slightly decrease the compressed size, or slightly increase it:
https://github.com/facebook/zstd/issues/2848.

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 scripts/Makefile.lib | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ca901814986a..c98a82ca38e6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -466,12 +466,20 @@ quiet_cmd_xzmisc = XZMISC  $@
 # single pass, so zstd doesn't need to allocate a window buffer. When streaming
 # decompression is used, like initramfs decompression, zstd22 should likely not
 # be used because it would require zstd to allocate a 128 MB buffer.
+#
+# --stream-size to reduce zstd memory usage (otherwise zstd -22 --ultra
+# allocates, but does not use, 2 GB) and potentially improve compression.
+#
+# --no-content-size to save three bytes which we do not use (we use size_append).
+
+# zstd --stream-size is only supported since 1.4.4
+zstd_stream_size = $(shell $(ZSTD) -1c --stream-size=0 --no-content-size </dev/null >/dev/null 2>&1 && printf '%s' '--stream-size=$(total_size) --no-content-size')
 
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) -19; $(size_append); } > $@
+      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) $(zstd_stream_size) -19; $(size_append); } > $@
 
 quiet_cmd_zstd22 = ZSTD22  $@
-      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
+      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) $(zstd_stream_size) -22 --ultra; $(size_append); } > $@
 
 # ASM offsets
 # ---------------------------------------------------------------------------
-- 
2.34.0

