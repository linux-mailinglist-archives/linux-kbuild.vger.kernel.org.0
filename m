Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA85724A0B
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 19:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238673AbjFFRT6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 13:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238677AbjFFRT5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 13:19:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF0F170E;
        Tue,  6 Jun 2023 10:19:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 307C46339E;
        Tue,  6 Jun 2023 17:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAD4C433EF;
        Tue,  6 Jun 2023 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686071981;
        bh=I0D5fplVAxa2IWHgNgakMM3V6L/4ep7GHZ+pIjDb3m4=;
        h=From:To:Cc:Subject:Date:From;
        b=UwreYTQjwmIJN50EjlQXN8JA3y9DtUxTc90kxdeS5Jhsdz269y83GJgA74tGcaYjL
         udTM6A+zB/GMsM+LwxakTa5moqfQWAt+B3eCkJ0dDfS33P1p+IQW6Q6k3AKQ5Rl7Nz
         VF6dOkX6h3M0GKtXfsqryFX8U0UUNhk4tpJzn4+fTKOV4zcCL0LlS+npwM3FMYE4dc
         V9anvqrYSTXzXeBCTVfPaffoHkEpNvczl0IIhHIT36LRQc8tfoySNI+b3qdyyavwrc
         hEXyF2teuTYhlkCfUbzonF6JkjU1SzzBPkue6JoqOWRKg0BhJfooFhfCjTEk76/08K
         h28/ikJ7MkHCw==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Derek Chickles <dchickles@marvell.com>,
        Satanand Burla <sburla@marvell.com>,
        Felix Manlunas <fmanlunas@marvell.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH net-next v2] net: liquidio: fix mixed module-builtin object
Date:   Wed,  7 Jun 2023 02:18:49 +0900
Message-Id: <20230606171849.2025648-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_LIQUIDIO=m and CONFIG_LIQUIDIO_VF=y (or vice versa),
$(common-objs) are linked to a module and also to vmlinux even though
the expected CFLAGS are different between builtins and modules.

This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
Fixing mixed module-builtin objects").

Introduce the new module, liquidio-core, to provide the common functions
to liquidio and liquidio-vf.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
---

Changes in v2:
  - Export lio_get_state_string
  - Remove $(common-objs) from Makefile

 drivers/net/ethernet/cavium/Kconfig           |  5 ++++
 drivers/net/ethernet/cavium/liquidio/Makefile |  8 ++++---
 .../cavium/liquidio/cn23xx_pf_device.c        |  4 ++++
 .../cavium/liquidio/cn23xx_vf_device.c        |  3 +++
 .../ethernet/cavium/liquidio/cn66xx_device.c  |  1 +
 .../ethernet/cavium/liquidio/cn68xx_device.c  |  1 +
 .../net/ethernet/cavium/liquidio/lio_core.c   | 16 +++++++++++++
 .../ethernet/cavium/liquidio/lio_ethtool.c    |  1 +
 .../ethernet/cavium/liquidio/octeon_device.c  | 24 +++++++++++++++++++
 .../ethernet/cavium/liquidio/octeon_droq.c    |  4 ++++
 .../ethernet/cavium/liquidio/octeon_mem_ops.c |  5 ++++
 .../net/ethernet/cavium/liquidio/octeon_nic.c |  3 +++
 .../cavium/liquidio/request_manager.c         | 14 +++++++++++
 .../cavium/liquidio/response_manager.c        |  3 +++
 14 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cavium/Kconfig b/drivers/net/ethernet/cavium/Kconfig
index 1c76c95b0b27..ca742cc146d7 100644
--- a/drivers/net/ethernet/cavium/Kconfig
+++ b/drivers/net/ethernet/cavium/Kconfig
@@ -62,6 +62,9 @@ config CAVIUM_PTP
 	  Precision Time Protocol or other purposes.  Timestamps can be used in
 	  BGX, TNS, GTI, and NIC blocks.
 
+config LIQUIDIO_CORE
+	tristate
+
 config LIQUIDIO
 	tristate "Cavium LiquidIO support"
 	depends on 64BIT && PCI
@@ -69,6 +72,7 @@ config LIQUIDIO
 	depends on PTP_1588_CLOCK_OPTIONAL
 	select FW_LOADER
 	select LIBCRC32C
+	select LIQUIDIO_CORE
 	select NET_DEVLINK
 	help
 	  This driver supports Cavium LiquidIO Intelligent Server Adapters
@@ -92,6 +96,7 @@ config LIQUIDIO_VF
 	tristate "Cavium LiquidIO VF support"
 	depends on 64BIT && PCI_MSI
 	depends on PTP_1588_CLOCK_OPTIONAL
+	select LIQUIDIO_CORE
 	help
 	  This driver supports Cavium LiquidIO Intelligent Server Adapter
 	  based on CN23XX chips.
diff --git a/drivers/net/ethernet/cavium/liquidio/Makefile b/drivers/net/ethernet/cavium/liquidio/Makefile
index bc9937502043..4ee80af88e79 100644
--- a/drivers/net/ethernet/cavium/liquidio/Makefile
+++ b/drivers/net/ethernet/cavium/liquidio/Makefile
@@ -3,7 +3,9 @@
 # Cavium Liquidio ethernet device driver
 #
 
-common-objs :=	lio_ethtool.o		\
+obj-$(CONFIG_LIQUIDIO_CORE) += liquidio-core.o
+liquidio-core-y := \
+		lio_ethtool.o		\
 		lio_core.o		\
 		request_manager.o	\
 		response_manager.o	\
@@ -18,7 +20,7 @@ common-objs :=	lio_ethtool.o		\
 		octeon_nic.o
 
 obj-$(CONFIG_LIQUIDIO) += liquidio.o
-liquidio-y := lio_main.o octeon_console.o lio_vf_rep.o $(common-objs)
+liquidio-y := lio_main.o octeon_console.o lio_vf_rep.o
 
 obj-$(CONFIG_LIQUIDIO_VF) += liquidio_vf.o
-liquidio_vf-y := lio_vf_main.o $(common-objs)
+liquidio_vf-y := lio_vf_main.o
diff --git a/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c b/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
index 9ed3d1ab2ca5..54b280114481 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
@@ -1377,6 +1377,7 @@ int setup_cn23xx_octeon_pf_device(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(setup_cn23xx_octeon_pf_device);
 
 int validate_cn23xx_pf_config_info(struct octeon_device *oct,
 				   struct octeon_config *conf23xx)
@@ -1435,6 +1436,7 @@ int cn23xx_fw_loaded(struct octeon_device *oct)
 	val = octeon_read_csr64(oct, CN23XX_SLI_SCRATCH2);
 	return (val >> SCR2_BIT_FW_LOADED) & 1ULL;
 }
+EXPORT_SYMBOL_GPL(cn23xx_fw_loaded);
 
 void cn23xx_tell_vf_its_macaddr_changed(struct octeon_device *oct, int vfidx,
 					u8 *mac)
@@ -1456,6 +1458,7 @@ void cn23xx_tell_vf_its_macaddr_changed(struct octeon_device *oct, int vfidx,
 		octeon_mbox_write(oct, &mbox_cmd);
 	}
 }
+EXPORT_SYMBOL_GPL(cn23xx_tell_vf_its_macaddr_changed);
 
 static void
 cn23xx_get_vf_stats_callback(struct octeon_device *oct,
@@ -1510,3 +1513,4 @@ int cn23xx_get_vf_stats(struct octeon_device *oct, int vfidx,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cn23xx_get_vf_stats);
diff --git a/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c b/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
index fda49404968c..ef4667b7e17f 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
@@ -386,6 +386,7 @@ void cn23xx_vf_ask_pf_to_do_flr(struct octeon_device *oct)
 
 	octeon_mbox_write(oct, &mbox_cmd);
 }
+EXPORT_SYMBOL_GPL(cn23xx_vf_ask_pf_to_do_flr);
 
 static void octeon_pfvf_hs_callback(struct octeon_device *oct,
 				    struct octeon_mbox_cmd *cmd,
@@ -468,6 +469,7 @@ int cn23xx_octeon_pfvf_handshake(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cn23xx_octeon_pfvf_handshake);
 
 static void cn23xx_handle_vf_mbox_intr(struct octeon_ioq_vector *ioq_vector)
 {
@@ -680,3 +682,4 @@ int cn23xx_setup_octeon_vf_device(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cn23xx_setup_octeon_vf_device);
diff --git a/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c b/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
index 39643be8c30a..93fccfec288d 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
@@ -697,6 +697,7 @@ int lio_setup_cn66xx_octeon_device(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(lio_setup_cn66xx_octeon_device);
 
 int lio_validate_cn6xxx_config_info(struct octeon_device *oct,
 				    struct octeon_config *conf6xxx)
diff --git a/drivers/net/ethernet/cavium/liquidio/cn68xx_device.c b/drivers/net/ethernet/cavium/liquidio/cn68xx_device.c
index 30254e4cf70f..b5103def3761 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn68xx_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn68xx_device.c
@@ -181,3 +181,4 @@ int lio_setup_cn68xx_octeon_device(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(lio_setup_cn68xx_octeon_device);
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index 882b2be06ea0..9cc6303c82ff 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -26,6 +26,9 @@
 #include "octeon_main.h"
 #include "octeon_network.h"
 
+MODULE_AUTHOR("Cavium Networks, <support@cavium.com>");
+MODULE_LICENSE("GPL");
+
 /* OOM task polling interval */
 #define LIO_OOM_POLL_INTERVAL_MS 250
 
@@ -71,6 +74,7 @@ void lio_delete_glists(struct lio *lio)
 	kfree(lio->glist);
 	lio->glist = NULL;
 }
+EXPORT_SYMBOL_GPL(lio_delete_glists);
 
 /**
  * lio_setup_glists - Setup gather lists
@@ -154,6 +158,7 @@ int lio_setup_glists(struct octeon_device *oct, struct lio *lio, int num_iqs)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(lio_setup_glists);
 
 int liquidio_set_feature(struct net_device *netdev, int cmd, u16 param1)
 {
@@ -180,6 +185,7 @@ int liquidio_set_feature(struct net_device *netdev, int cmd, u16 param1)
 	}
 	return ret;
 }
+EXPORT_SYMBOL_GPL(liquidio_set_feature);
 
 void octeon_report_tx_completion_to_bql(void *txq, unsigned int pkts_compl,
 					unsigned int bytes_compl)
@@ -395,6 +401,7 @@ void liquidio_link_ctrl_cmd_completion(void *nctrl_ptr)
 			nctrl->ncmd.s.cmd);
 	}
 }
+EXPORT_SYMBOL_GPL(liquidio_link_ctrl_cmd_completion);
 
 void octeon_pf_changed_vf_macaddr(struct octeon_device *oct, u8 *mac)
 {
@@ -478,6 +485,7 @@ int setup_rx_oom_poll_fn(struct net_device *netdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(setup_rx_oom_poll_fn);
 
 void cleanup_rx_oom_poll_fn(struct net_device *netdev)
 {
@@ -495,6 +503,7 @@ void cleanup_rx_oom_poll_fn(struct net_device *netdev)
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(cleanup_rx_oom_poll_fn);
 
 /* Runs in interrupt context. */
 static void lio_update_txq_status(struct octeon_device *oct, int iq_num)
@@ -899,6 +908,7 @@ int liquidio_setup_io_queues(struct octeon_device *octeon_dev, int ifidx,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(liquidio_setup_io_queues);
 
 static
 int liquidio_schedule_msix_droq_pkt_handler(struct octeon_droq *droq, u64 ret)
@@ -1194,6 +1204,7 @@ int octeon_setup_interrupt(struct octeon_device *oct, u32 num_ioqs)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_setup_interrupt);
 
 /**
  * liquidio_change_mtu - Net device change_mtu
@@ -1256,6 +1267,7 @@ int liquidio_change_mtu(struct net_device *netdev, int new_mtu)
 	WRITE_ONCE(sc->caller_is_done, true);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(liquidio_change_mtu);
 
 int lio_wait_for_clean_oq(struct octeon_device *oct)
 {
@@ -1279,6 +1291,7 @@ int lio_wait_for_clean_oq(struct octeon_device *oct)
 
 	return pending_pkts;
 }
+EXPORT_SYMBOL_GPL(lio_wait_for_clean_oq);
 
 static void
 octnet_nic_stats_callback(struct octeon_device *oct_dev,
@@ -1509,6 +1522,7 @@ void lio_fetch_stats(struct work_struct *work)
 
 	return;
 }
+EXPORT_SYMBOL_GPL(lio_fetch_stats);
 
 int liquidio_set_speed(struct lio *lio, int speed)
 {
@@ -1659,6 +1673,7 @@ int liquidio_get_speed(struct lio *lio)
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(liquidio_get_speed);
 
 int liquidio_set_fec(struct lio *lio, int on_off)
 {
@@ -1812,3 +1827,4 @@ int liquidio_get_fec(struct lio *lio)
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(liquidio_get_fec);
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
index 2c10ae3f7fc1..9d56181a301f 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
@@ -3180,3 +3180,4 @@ void liquidio_set_ethtool_ops(struct net_device *netdev)
 	else
 		netdev->ethtool_ops = &lio_ethtool_ops;
 }
+EXPORT_SYMBOL_GPL(liquidio_set_ethtool_ops);
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_device.c b/drivers/net/ethernet/cavium/liquidio/octeon_device.c
index e159194d0aef..364f4f912dc2 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_device.c
@@ -564,6 +564,7 @@ void octeon_init_device_list(int conf_type)
 	for (i = 0; i <  MAX_OCTEON_DEVICES; i++)
 		oct_set_config_info(i, conf_type);
 }
+EXPORT_SYMBOL_GPL(octeon_init_device_list);
 
 static void *__retrieve_octeon_config_info(struct octeon_device *oct,
 					   u16 card_type)
@@ -633,6 +634,7 @@ char *lio_get_state_string(atomic_t *state_ptr)
 		return oct_dev_state_str[OCT_DEV_STATE_INVALID];
 	return oct_dev_state_str[istate];
 }
+EXPORT_SYMBOL_GPL(lio_get_state_string);
 
 static char *get_oct_app_string(u32 app_mode)
 {
@@ -661,6 +663,7 @@ void octeon_free_device_mem(struct octeon_device *oct)
 	octeon_device[i] = NULL;
 	octeon_device_count--;
 }
+EXPORT_SYMBOL_GPL(octeon_free_device_mem);
 
 static struct octeon_device *octeon_allocate_device_mem(u32 pci_id,
 							u32 priv_size)
@@ -747,6 +750,7 @@ struct octeon_device *octeon_allocate_device(u32 pci_id,
 
 	return oct;
 }
+EXPORT_SYMBOL_GPL(octeon_allocate_device);
 
 /** Register a device's bus location at initialization time.
  *  @param octeon_dev - pointer to the octeon device structure.
@@ -804,6 +808,7 @@ int octeon_register_device(struct octeon_device *oct,
 
 	return refcount;
 }
+EXPORT_SYMBOL_GPL(octeon_register_device);
 
 /** Deregister a device at de-initialization time.
  *  @param octeon_dev - pointer to the octeon device structure.
@@ -821,6 +826,7 @@ int octeon_deregister_device(struct octeon_device *oct)
 
 	return refcount;
 }
+EXPORT_SYMBOL_GPL(octeon_deregister_device);
 
 int
 octeon_allocate_ioq_vector(struct octeon_device *oct, u32 num_ioqs)
@@ -853,12 +859,14 @@ octeon_allocate_ioq_vector(struct octeon_device *oct, u32 num_ioqs)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_allocate_ioq_vector);
 
 void
 octeon_free_ioq_vector(struct octeon_device *oct)
 {
 	vfree(oct->ioq_vector);
 }
+EXPORT_SYMBOL_GPL(octeon_free_ioq_vector);
 
 /* this function is only for setting up the first queue */
 int octeon_setup_instr_queues(struct octeon_device *oct)
@@ -904,6 +912,7 @@ int octeon_setup_instr_queues(struct octeon_device *oct)
 	oct->num_iqs++;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_setup_instr_queues);
 
 int octeon_setup_output_queues(struct octeon_device *oct)
 {
@@ -940,6 +949,7 @@ int octeon_setup_output_queues(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_setup_output_queues);
 
 int octeon_set_io_queues_off(struct octeon_device *oct)
 {
@@ -989,6 +999,7 @@ int octeon_set_io_queues_off(struct octeon_device *oct)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_set_io_queues_off);
 
 void octeon_set_droq_pkt_op(struct octeon_device *oct,
 			    u32 q_no,
@@ -1027,6 +1038,7 @@ int octeon_init_dispatch_list(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_init_dispatch_list);
 
 void octeon_delete_dispatch_list(struct octeon_device *oct)
 {
@@ -1058,6 +1070,7 @@ void octeon_delete_dispatch_list(struct octeon_device *oct)
 		kfree(temp);
 	}
 }
+EXPORT_SYMBOL_GPL(octeon_delete_dispatch_list);
 
 octeon_dispatch_fn_t
 octeon_get_dispatch(struct octeon_device *octeon_dev, u16 opcode,
@@ -1180,6 +1193,7 @@ octeon_register_dispatch_fn(struct octeon_device *oct,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_register_dispatch_fn);
 
 int octeon_core_drv_init(struct octeon_recv_info *recv_info, void *buf)
 {
@@ -1262,6 +1276,7 @@ int octeon_core_drv_init(struct octeon_recv_info *recv_info, void *buf)
 	octeon_free_recv_info(recv_info);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_core_drv_init);
 
 int octeon_get_tx_qsize(struct octeon_device *oct, u32 q_no)
 
@@ -1272,6 +1287,7 @@ int octeon_get_tx_qsize(struct octeon_device *oct, u32 q_no)
 
 	return -1;
 }
+EXPORT_SYMBOL_GPL(octeon_get_tx_qsize);
 
 int octeon_get_rx_qsize(struct octeon_device *oct, u32 q_no)
 {
@@ -1280,6 +1296,7 @@ int octeon_get_rx_qsize(struct octeon_device *oct, u32 q_no)
 		return oct->droq[q_no]->max_count;
 	return -1;
 }
+EXPORT_SYMBOL_GPL(octeon_get_rx_qsize);
 
 /* Retruns the host firmware handshake OCTEON specific configuration */
 struct octeon_config *octeon_get_conf(struct octeon_device *oct)
@@ -1302,6 +1319,7 @@ struct octeon_config *octeon_get_conf(struct octeon_device *oct)
 	}
 	return default_oct_conf;
 }
+EXPORT_SYMBOL_GPL(octeon_get_conf);
 
 /* scratch register address is same in all the OCT-II and CN70XX models */
 #define CNXX_SLI_SCRATCH1   0x3C0
@@ -1318,6 +1336,7 @@ struct octeon_device *lio_get_device(u32 octeon_id)
 	else
 		return octeon_device[octeon_id];
 }
+EXPORT_SYMBOL_GPL(lio_get_device);
 
 u64 lio_pci_readq(struct octeon_device *oct, u64 addr)
 {
@@ -1349,6 +1368,7 @@ u64 lio_pci_readq(struct octeon_device *oct, u64 addr)
 
 	return val64;
 }
+EXPORT_SYMBOL_GPL(lio_pci_readq);
 
 void lio_pci_writeq(struct octeon_device *oct,
 		    u64 val,
@@ -1369,6 +1389,7 @@ void lio_pci_writeq(struct octeon_device *oct,
 
 	spin_unlock_irqrestore(&oct->pci_win_lock, flags);
 }
+EXPORT_SYMBOL_GPL(lio_pci_writeq);
 
 int octeon_mem_access_ok(struct octeon_device *oct)
 {
@@ -1388,6 +1409,7 @@ int octeon_mem_access_ok(struct octeon_device *oct)
 
 	return access_okay ? 0 : 1;
 }
+EXPORT_SYMBOL_GPL(octeon_mem_access_ok);
 
 int octeon_wait_for_ddr_init(struct octeon_device *oct, u32 *timeout)
 {
@@ -1408,6 +1430,7 @@ int octeon_wait_for_ddr_init(struct octeon_device *oct, u32 *timeout)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(octeon_wait_for_ddr_init);
 
 /* Get the octeon id assigned to the octeon device passed as argument.
  *  This function is exported to other modules.
@@ -1462,3 +1485,4 @@ void lio_enable_irq(struct octeon_droq *droq, struct octeon_instr_queue *iq)
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(lio_enable_irq);
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_droq.c b/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
index d4080bddcb6b..0d6ee30affb9 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
@@ -107,6 +107,7 @@ u32 octeon_droq_check_hw_for_pkts(struct octeon_droq *droq)
 
 	return last_count;
 }
+EXPORT_SYMBOL_GPL(octeon_droq_check_hw_for_pkts);
 
 static void octeon_droq_compute_max_packet_bufs(struct octeon_droq *droq)
 {
@@ -216,6 +217,7 @@ int octeon_delete_droq(struct octeon_device *oct, u32 q_no)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_delete_droq);
 
 int octeon_init_droq(struct octeon_device *oct,
 		     u32 q_no,
@@ -773,6 +775,7 @@ octeon_droq_process_packets(struct octeon_device *oct,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_droq_process_packets);
 
 /*
  * Utility function to poll for packets. check_hw_for_packets must be
@@ -921,6 +924,7 @@ int octeon_unregister_droq_ops(struct octeon_device *oct, u32 q_no)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_unregister_droq_ops);
 
 int octeon_create_droq(struct octeon_device *oct,
 		       u32 q_no, u32 num_descs,
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c b/drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c
index 7ccab36143c1..d70132437af3 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c
@@ -164,6 +164,7 @@ octeon_pci_read_core_mem(struct octeon_device *oct,
 {
 	__octeon_pci_rw_core_mem(oct, coreaddr, buf, len, 1);
 }
+EXPORT_SYMBOL_GPL(octeon_pci_read_core_mem);
 
 void
 octeon_pci_write_core_mem(struct octeon_device *oct,
@@ -173,6 +174,7 @@ octeon_pci_write_core_mem(struct octeon_device *oct,
 {
 	__octeon_pci_rw_core_mem(oct, coreaddr, (u8 *)buf, len, 0);
 }
+EXPORT_SYMBOL_GPL(octeon_pci_write_core_mem);
 
 u64 octeon_read_device_mem64(struct octeon_device *oct, u64 coreaddr)
 {
@@ -182,6 +184,7 @@ u64 octeon_read_device_mem64(struct octeon_device *oct, u64 coreaddr)
 
 	return be64_to_cpu(ret);
 }
+EXPORT_SYMBOL_GPL(octeon_read_device_mem64);
 
 u32 octeon_read_device_mem32(struct octeon_device *oct, u64 coreaddr)
 {
@@ -191,6 +194,7 @@ u32 octeon_read_device_mem32(struct octeon_device *oct, u64 coreaddr)
 
 	return be32_to_cpu(ret);
 }
+EXPORT_SYMBOL_GPL(octeon_read_device_mem32);
 
 void octeon_write_device_mem32(struct octeon_device *oct, u64 coreaddr,
 			       u32 val)
@@ -199,3 +203,4 @@ void octeon_write_device_mem32(struct octeon_device *oct, u64 coreaddr,
 
 	__octeon_pci_rw_core_mem(oct, coreaddr, (u8 *)&t, 4, 0);
 }
+EXPORT_SYMBOL_GPL(octeon_write_device_mem32);
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_nic.c b/drivers/net/ethernet/cavium/liquidio/octeon_nic.c
index 1a706f81bbb0..dee56ea740e7 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_nic.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_nic.c
@@ -79,6 +79,7 @@ octeon_alloc_soft_command_resp(struct octeon_device    *oct,
 
 	return sc;
 }
+EXPORT_SYMBOL_GPL(octeon_alloc_soft_command_resp);
 
 int octnet_send_nic_data_pkt(struct octeon_device *oct,
 			     struct octnic_data_pkt *ndata,
@@ -90,6 +91,7 @@ int octnet_send_nic_data_pkt(struct octeon_device *oct,
 				   ndata->buf, ndata->datasize,
 				   ndata->reqtype);
 }
+EXPORT_SYMBOL_GPL(octnet_send_nic_data_pkt);
 
 static inline struct octeon_soft_command
 *octnic_alloc_ctrl_pkt_sc(struct octeon_device *oct,
@@ -196,3 +198,4 @@ octnet_send_nic_ctrl_pkt(struct octeon_device *oct,
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(octnet_send_nic_ctrl_pkt);
diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index 32f854c0cd79..de8a6ce86ad7 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -185,6 +185,7 @@ int octeon_delete_instr_queue(struct octeon_device *oct, u32 iq_no)
 	}
 	return 1;
 }
+EXPORT_SYMBOL_GPL(octeon_delete_instr_queue);
 
 /* Return 0 on success, 1 on failure */
 int octeon_setup_iq(struct octeon_device *oct,
@@ -258,6 +259,7 @@ int lio_wait_for_instr_fetch(struct octeon_device *oct)
 
 	return instr_cnt;
 }
+EXPORT_SYMBOL_GPL(lio_wait_for_instr_fetch);
 
 static inline void
 ring_doorbell(struct octeon_device *oct, struct octeon_instr_queue *iq)
@@ -282,6 +284,7 @@ octeon_ring_doorbell_locked(struct octeon_device *oct, u32 iq_no)
 		ring_doorbell(oct, iq);
 	spin_unlock(&iq->post_lock);
 }
+EXPORT_SYMBOL_GPL(octeon_ring_doorbell_locked);
 
 static inline void __copy_cmd_into_iq(struct octeon_instr_queue *iq,
 				      u8 *cmd)
@@ -345,6 +348,7 @@ octeon_register_reqtype_free_fn(struct octeon_device *oct, int reqtype,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_register_reqtype_free_fn);
 
 static inline void
 __add_to_request_list(struct octeon_instr_queue *iq,
@@ -430,6 +434,7 @@ lio_process_iq_request_list(struct octeon_device *oct,
 
 	return inst_count;
 }
+EXPORT_SYMBOL_GPL(lio_process_iq_request_list);
 
 /* Can only be called from process context */
 int
@@ -566,6 +571,7 @@ octeon_send_command(struct octeon_device *oct, u32 iq_no,
 
 	return st.status;
 }
+EXPORT_SYMBOL_GPL(octeon_send_command);
 
 void
 octeon_prepare_soft_command(struct octeon_device *oct,
@@ -673,6 +679,7 @@ octeon_prepare_soft_command(struct octeon_device *oct,
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(octeon_prepare_soft_command);
 
 int octeon_send_soft_command(struct octeon_device *oct,
 			     struct octeon_soft_command *sc)
@@ -726,6 +733,7 @@ int octeon_send_soft_command(struct octeon_device *oct,
 	return (octeon_send_command(oct, sc->iq_no, 1, &sc->cmd, sc,
 				    len, REQTYPE_SOFT_COMMAND));
 }
+EXPORT_SYMBOL_GPL(octeon_send_soft_command);
 
 int octeon_setup_sc_buffer_pool(struct octeon_device *oct)
 {
@@ -755,6 +763,7 @@ int octeon_setup_sc_buffer_pool(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_setup_sc_buffer_pool);
 
 int octeon_free_sc_done_list(struct octeon_device *oct)
 {
@@ -794,6 +803,7 @@ int octeon_free_sc_done_list(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_free_sc_done_list);
 
 int octeon_free_sc_zombie_list(struct octeon_device *oct)
 {
@@ -818,6 +828,7 @@ int octeon_free_sc_zombie_list(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_free_sc_zombie_list);
 
 int octeon_free_sc_buffer_pool(struct octeon_device *oct)
 {
@@ -842,6 +853,7 @@ int octeon_free_sc_buffer_pool(struct octeon_device *oct)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(octeon_free_sc_buffer_pool);
 
 struct octeon_soft_command *octeon_alloc_soft_command(struct octeon_device *oct,
 						      u32 datasize,
@@ -913,6 +925,7 @@ struct octeon_soft_command *octeon_alloc_soft_command(struct octeon_device *oct,
 
 	return sc;
 }
+EXPORT_SYMBOL_GPL(octeon_alloc_soft_command);
 
 void octeon_free_soft_command(struct octeon_device *oct,
 			      struct octeon_soft_command *sc)
@@ -925,3 +938,4 @@ void octeon_free_soft_command(struct octeon_device *oct,
 
 	spin_unlock_bh(&oct->sc_buf_pool.lock);
 }
+EXPORT_SYMBOL_GPL(octeon_free_soft_command);
diff --git a/drivers/net/ethernet/cavium/liquidio/response_manager.c b/drivers/net/ethernet/cavium/liquidio/response_manager.c
index ac7747ccf56a..861050966e18 100644
--- a/drivers/net/ethernet/cavium/liquidio/response_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/response_manager.c
@@ -52,12 +52,14 @@ int octeon_setup_response_list(struct octeon_device *oct)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(octeon_setup_response_list);
 
 void octeon_delete_response_list(struct octeon_device *oct)
 {
 	cancel_delayed_work_sync(&oct->dma_comp_wq.wk.work);
 	destroy_workqueue(oct->dma_comp_wq.wq);
 }
+EXPORT_SYMBOL_GPL(octeon_delete_response_list);
 
 int lio_process_ordered_list(struct octeon_device *octeon_dev,
 			     u32 force_quit)
@@ -219,6 +221,7 @@ int lio_process_ordered_list(struct octeon_device *octeon_dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(lio_process_ordered_list);
 
 static void oct_poll_req_completion(struct work_struct *work)
 {
-- 
2.39.2

