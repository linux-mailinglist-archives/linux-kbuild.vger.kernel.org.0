Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6998C457FA8
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Nov 2021 17:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhKTQ4x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Nov 2021 11:56:53 -0500
Received: from sonic313-19.consmr.mail.gq1.yahoo.com ([98.137.65.82]:37588
        "EHLO sonic313-19.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231953AbhKTQ4w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Nov 2021 11:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1637427229; bh=TfoAxPbVKq3zi4ZOFlupwW3LmX5ZEGSByQNRZE7lVEM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=am3+4RQLcmR5Gf4mg/PhWbDNq2yIzWVbmom3oVsOsBJAVakIBwAXOqUskPiW+4rBE20ADCJlAorvH3D3oo1M1VdF0GlW7RnANrxrDw+uIaUPnp4v+5Y09Hpd82gaF50yM+UeR1TSdJlI4UxD9rBeBPeCwC7WVmUk540RfD7TdbiwnN2zlVg7i3Py8BlwQfNc1aS7EQaneJKIpa/dek6XWncsqVqdLUPVNdV0J2bbqbCXeRo+NbvTxB8ovf9AM0G2fiN68QIU/9W98V48IeX+wnrkEaA99jekasnoOYxSxPsystVbpBalo6l7K68qbRkEBCUtbz2LgYvd3iBr4eXosQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1637427229; bh=EaWA+RVHuaO6L/Bpvd9UKJ5L9Qd2Bx3pYfWduCZYvHV=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=seLD4luJ/rxpL+KaCgJ8oGkqM5d6eTCozB5rVtZP2rsX5FBu8UAfzlAzrX6OHSkfUd80iqGqp/G+h8ejk5Jfk+fT6scGsRm0DPDKDDkCo1pfHTKTfzrb9IT4Lapyb1aR0Jt7JbY9sTIZcCUOdVaupfqhP3coytp97BNnCss8/+kTd1e1UXXhugVUwMg4TGPItf/ednldUW3qdjG//SfeGo+uTztCieNNyTUbKJGbUFe1XTTTSh3r3KP5bPB8HJu48db0mULOeJwArVddSgKee+KMXZV+kbUGua6R8hNcOdBnM1XQgEBTWJOKLhQfeAOEp/TxgVVbC2A87QyjRUhPZQ==
X-YMail-OSG: xcBk8OMVM1lyMMO5EMSCdqQ60Z6ef8qcgDiZ_RJu9DaGh2XJgiif51owCGnhnX3
 cpd2w7gMzfDojQRr3igB0sFO61jc98SfyNJ9Z5xjsvJ_F.JnzIv5HJH3enl8xALXiilc0RpWKOmF
 Kve.HcIHjYfKeraH6QJkPed40mw7vAG..qpkL2WMz4CnkOi4sn8Kv0xXkGZSEE5nuc_JcBEwaAjS
 F_uGaIHjHqnUSL16qZmn1E_K.VAohp4t99Wdd75Q_RVLtkEoPfHu85eyi7_DFDBrhLGhWD5vAgOJ
 ITtDS.6.MpZ6_ltmtwbRFoImDEkpJUuT75bAv2w2HjcF_k8RtzH0JqJEr0uPpJA3NyK4SfYAuLir
 d8Yo0CwQVXE17udgaCXA17s3E0apAhQH7ieMCDzV0IJub8eIBBxNsfMVLFykGgTGrmJ7Ti0IR7Si
 gHY3DZCMVkA6H2bUpb1i7qSAxOMzh_yUFStxTaM6MjyIW8zGc904pHonQeCUTxobiokKUSCtu7XO
 a9Si.stogVqQ2ML0PZxxi_1psneeTn3pjA5W2ilWf3VPVixj3II5qIB1ns7ivpb9_7T25L.MWb2u
 rtxJhEjS3YCJyiVW3jzbMPLu4vNrcp6nEB2rYOFztk9LW.qpR9Vj.sMRyEVWotSCiML4KOSKlVYz
 Rr7KHPZD8FUtpnXH_0rHADofGAZQEe9ThcE2S0UKz9hBB.SPk_Bmwju7dGYijvELIWS9Cdyh6c3y
 ac_vsOoRb7Zq8hvDcf_l_HPbjF7oidEcclRZq8qkn_FdXTQMo8LkjP3fbSLubKAgiP2axbgl52TS
 gIO2DD12rzbz4Xl9rnyrmzjktZcAZ0u6ocyH5ffMxVGv04ufWjN1AK7ig_KMe5fy0ZLol4Eia6CP
 7MxXh8zQfQeJgzUYr250qpRIMKuW5ipGOPV0sWla7tKTkLG_Sjp64xdvK_nUftfxyEY4L7xw3xff
 WQq__B94gA6az4.0jF2W6YmKboCChk_qRhosCg4HoK66NzQEx3dDxmlwj5O6HNtjOMPQ8IY9Q.FX
 oS17zTi1iRFpZ7bOjV4Lz4eedaBWMw7.qqE2EBbb33.UeHeTJWRlm9XWOIYlG_BrfOve0wFDTJIk
 ixswKoc6khaBnN6XlYDJzsK97ueBoApOcIbIYnLgOX88fU8nlh3YBT8NWqjFvY4MsatE6HtB8pk1
 YbK3jy0WENg2mGG4FYLvqsULwt3iFLpal4mfayc2caR56Xkp7wBCMPdsPGRljdn53YeD8MKVQvJc
 9WX0CppFs1.AiO7ZNp_tdWxHC9nF.8g5yfCXV9tl9iBF9V8UA9AEKv68h__iMMbMhp_PmigCcsRP
 8Juw2PIt0e.mZV0foGtGvA6MUhSzZ9NlxcvmN42fzCEjeoKBlv56EZkUtUbvOOnLV93f3DK0Yp8G
 .dEgOf5EmjCQkgH76uv4InXL_sExWYK3fQzHDFYED93J0VClMnx6eB.v7rdCpzRBw5KxCpU5ezz4
 t9cgkQRxhQylmKHYDW9YQe07QpbHMijeBkkThdCqeKIypzvuSCmxL5spNtoF2S.3GYprJWBHuMMN
 t.XG9SSiY7ahQQn0GkPvJcbuZgY6DeBL4QM4UEyKkrKYQCciXmIe3vRPvG6uHcXzPtUzf0YjwsnI
 ecnaQffkI9yPi5T.JLH8kmBK9YCdnwunns0zdzTCP6r4T_FmL0JN2x80J3jLFGt0xeU_3Djs8Uid
 mq.sJE2CiNiCWyHQKhSdH2lV6XeSQdqA19kegdph0UrGxpjput2CXC0qdZUuCYISBfkIwH8o5BeZ
 K2XE8X3eQkJLdR1N4N3_JuanS4JHV93VtqtyjPSl227hEmWCDM4GskA1o5qT_3LemOmFUtwZuamv
 luXOXpWao6Kc8b84ORNioP5oqno9Md8JtbuBz3v2V5TiyCnUemPa1Z4DafYwpHP3NHh_x1aMmMNw
 a4UOgWWLMMA9DIabfj62puPzmFDkoftZcIuDy7_CoOwt.nulVHvrruxVEcYp4lGJzuMw4..Z3_1K
 wEJm5C0SUgd4ZkHi0hPVlivU8mycBdwqp47MNszQ2vBzT_b.rtdH9hPc1GMOm4h5OO03ZDI7RDub
 JkSSnRdkZilDPCrOU_dvspumP4zmwr1aLw8X0DeQzLspvo9ra9KjdYJ.j2ccw561geDNLrGVozeg
 WCTMbchqeLGw0T8wIFTSAMbuy3i_LGy_jrVilfk4bksYhD2EUjjEO5qRXKU.QCOcKcJnmwuBfN9.
 6d7XgENCp30XpqaNnMoNqHkdeoUlEgzD8azaEYM6Bw8QtFu54ihCht2FbQjhihswLmM5fJjfCdW1
 7XN.p8RI-
X-Sonic-MF: <alex_y_xu@yahoo.ca>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.gq1.yahoo.com with HTTP; Sat, 20 Nov 2021 16:53:49 +0000
Received: by kubenode520.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 1fe9458f13b759c836a26a4b522c3af1;
          Sat, 20 Nov 2021 16:53:43 +0000 (UTC)
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
Subject: [PATCH 2/2] kbuild: pass --stream-size --no-content-size to zstd
Date:   Sat, 20 Nov 2021 11:53:49 -0500
Message-Id: <20211120165349.99908-2-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211120165349.99908-1-alex_y_xu@yahoo.ca>
References: <20211120165349.99908-1-alex_y_xu@yahoo.ca>
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
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ca901814986a..13d756fbcdc7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -468,10 +468,10 @@ quiet_cmd_xzmisc = XZMISC  $@
 # be used because it would require zstd to allocate a 128 MB buffer.
 
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) -19; $(size_append); } > $@
+      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) --stream-size=$(total_size) --no-content-size -19; $(size_append); } > $@
 
 quiet_cmd_zstd22 = ZSTD22  $@
-      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
+      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) --stream-size=$(total_size) --no-content-size -22 --ultra; $(size_append); } > $@
 
 # ASM offsets
 # ---------------------------------------------------------------------------
-- 
2.34.0

